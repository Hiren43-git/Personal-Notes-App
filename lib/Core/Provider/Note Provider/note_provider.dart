import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Database%20Service/Note%20database%20Service/note_database_service.dart';
import 'package:personal_notes_app/Core/Model/Note%20Model/note_model.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';
import 'package:personal_notes_app/Utils/Constants/Strings/strings.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> notes = [];
  final NoteDatabaseService noteService = NoteDatabaseService();

  Future<void> loadNotes(String userId) async {
    notes = await noteService.fetchNotes(userId);
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await noteService.createNote(note);
    notes.add(note);
    notifyListeners();
  }

  Future<void> updateNote(NoteModel note) async {
    await noteService.updateNote(note);
    int index = notes.indexWhere(
      (element) => element.id == note.id,
    );
    if (index != -1) {
      notes[index] = note;
      notifyListeners();
    }
  }

  Future<void> deleteNote(String noteId) async {
    await noteService.deleteNote(noteId);
    notes.removeWhere(
      (element) => element.id == noteId,
    );
    notifyListeners();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController newTagController = TextEditingController();
  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();
  FocusNode newTagFocus = FocusNode();

  int drawerIndex = 0;

  void selectedDrawer(int index) {
    drawerIndex = index;
    notifyListeners();
  }

  List drawerWidget = [
    {
      'name': AppStrings.notes,
      'icon': AppImages.note,
    },
    {
      'name': AppStrings.tags,
      'icon': AppImages.hasTag,
    },
    {
      'name': AppStrings.logout,
      'icon': AppImages.logout,
    },
  ];
}
