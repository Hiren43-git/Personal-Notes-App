import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Note%20Provider/note_provider.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/button_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/icon_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/text_form_field.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';
import 'package:personal_notes_app/Utils/Constants/Strings/strings.dart';
import 'package:provider/provider.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final provider = Provider.of<NoteProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            size: w * 0.07,
          ),
        ),
        title: Text(
          AppStrings.tags,
          style: titleStyle.copyWith(fontSize: w * 0.05066),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: w * 0.0266,
            ),
            Text(
              AppStrings.allTag,
              style: titleStyle.copyWith(fontSize: w * 0.05066),
            ),
            SizedBox(
              height: w * 0.05866,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: w * 0.06933),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal',
                    style: TextStyle(
                      fontSize: w * 0.04266,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IconWidget(
                    image: AppImages.edit,
                    height: w * 0.048,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal',
                  style: TextStyle(
                    fontSize: w * 0.04266,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                IconWidget(
                  image: AppImages.edit,
                  height: w * 0.048,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormFieldWidget(
                controller: provider.newTagController,
                focusNode: provider.newTagFocus,
                hint: AppStrings.addTag,
              ),
              SizedBox(
                height: w * 0.064,
              ),
              ButtonWidget(
                text: AppStrings.add,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
