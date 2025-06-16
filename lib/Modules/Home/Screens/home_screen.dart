import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Auth%20Provider/auth_provider.dart';
import 'package:personal_notes_app/Core/Provider/Note%20Provider/note_provider.dart';
import 'package:personal_notes_app/Modules/Edit%20Note/Screen/edit_note_screen.dart';
import 'package:personal_notes_app/Modules/Home/Widget/note_widget.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Screens/login_screen.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Modules/Tag/Screen/tag_screen.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/icon_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';
import 'package:personal_notes_app/Utils/Constants/Strings/strings.dart';
import 'package:provider/provider.dart';

import '../../../Utils/Constants/Color/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final provider = Provider.of<NoteProvider>(context);
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              provider.drawerIndex = 0;
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: w * 0.06,
            ),
          );
        }),
        centerTitle: true,
        title: Text(
          AppStrings.myNotes,
          style: titleStyle.copyWith(fontSize: w * 0.05066),
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        shape:
            BeveledRectangleBorder(side: BorderSide(style: BorderStyle.none)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Sophia',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ...List.generate(provider.drawerWidget.length, (index) {
                  bool isSelected = provider.drawerIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        provider.selectedDrawer(index);
                        if (index == 0) {
                          Navigator.of(context).pop();
                        }
                        if (index == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TagScreen(),
                            ),
                          );
                        }
                        if (index == 2) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: AppColors.backgroundColor,
                              content: Text(AppStrings.confirmLogout),
                              title: Text(
                                AppStrings.logout,
                                style: titleStyle.copyWith(
                                  fontSize: w * 0.05066,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.textBackground,
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8),
                                          child: Text(
                                            AppStrings.cancel,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        authProvider.signOut(context);
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.textBackground,
                                        ),
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 8),
                                          child: Text(AppStrings.logout,
                                              style: TextStyle(
                                                  color: AppColors.red,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                        provider.drawerIndex = 0;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.textBackground
                              : AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              IconWidget(
                                image: provider.drawerWidget[index]['icon'],
                                height: 20,
                              ),
                              SizedBox(
                                width: 28,
                              ),
                              Text(
                                provider.drawerWidget[index]['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.textBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 14),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.all,
                              style: TextStyle(
                                  fontSize: w * 0.0426,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconWidget(
                              image: AppImages.downArrow,
                              height: w * 0.032,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: w * 0.0533,
            ),
            ...List.generate(provider.notes.length, (index) {
              final note = provider.notes[index];
              return NoteWidget(
                title: note.title,
                content: note.content,
                date: note.createdDate.toString(),
              );
            }),
            // NoteWidget(
            //   title: 'App Title 1',
            //   content:
            //       'Created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34  Created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 ',
            //   date: 'created date 4 434 344 34',
            // ),
            // NoteWidget(
            //   title: 'App Title 1',
            //   content:
            //       'Created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34  Created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 created date 4 434 344 34 ',
            //   date: 'created date 4 434 344 34',
            // ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(),
            ),
          );
        },
        child: Container(
          height: w * 0.1333,
          width: w * 0.1333,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.buttonColor,
          ),
          alignment: Alignment.center,
          child: IconWidget(
            height: w * 0.04266,
            image: AppImages.plus,
          ),
        ),
      ),
    );
  }
}
