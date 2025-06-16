import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Database%20Service/Auth%20Database%20Service/auth_service.dart';
import 'package:personal_notes_app/Core/Model/Note%20Model/note_model.dart';
import 'package:personal_notes_app/Core/Provider/Note%20Provider/note_provider.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/button_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Strings/strings.dart';
import 'package:provider/provider.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel? note;
  const EditNoteScreen({super.key, this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final provider = Provider.of<NoteProvider>(context);
    final newNote = widget.note == null;
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
            Icons.close,
            size: w * 0.07,
          ),
        ),
        title: Text(
          AppStrings.editNote,
          style: titleStyle.copyWith(fontSize: w * 0.05066),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: w * 0.0266,
            ),
            TextField(
              style: hintTextStyle.copyWith(fontSize: w * 0.04266),
              focusNode: provider.titleFocus,
              controller: provider.titleController,
              autocorrect: false,
              cursorColor: AppColors.textColor,
              cursorHeight: w * 0.06,
              maxLines: 4,
              onSubmitted: (value) {
                FocusScope.of(context).requestFocus(provider.contentFocus);
              },
              buildCounter: (context,
                  {int? currentLength, bool? isFocused, int? maxLength}) {
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textBackground,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.064,
            ),
            TextField(
              style: hintTextStyle.copyWith(fontSize: w * 0.04266),
              focusNode: provider.contentFocus,
              controller: provider.contentController,
              cursorColor: AppColors.textColor,
              autocorrect: false,
              cursorHeight: w * 0.06,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textBackground,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.064,
            ),
            Wrap(
              runSpacing: 12,
              spacing: 12,
              children: [
                ...List.generate(
                  6,
                  (index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.textBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16),
                      child: Text(
                        'Project',
                        style: TextStyle(
                            fontSize: w * 0.038, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              final note = NoteModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                userId: AuthDatabaseService().supabase.auth.currentUser!.id,
                title: provider.titleController.text,
                content: provider.contentController.text,
                tags: [],
                createdDate: DateTime.now(),
                updatedDate: DateTime.now(),
              );
              if (newNote) {
                provider.addNote(note);
                Navigator.of(context).pop();
              } else {
                provider.updateNote(note);
                Navigator.of(context).pop();
              }
            },
            child: ButtonWidget(
              text: AppStrings.save,
            ),
          ),
        ),
      ),
    );
  }
}
