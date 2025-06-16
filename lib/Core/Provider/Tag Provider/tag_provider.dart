import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Database%20Service/Tags%20Database%20Service/tag_database_service.dart';
import 'package:personal_notes_app/Core/Model/Tag%20Model/tag_model.dart';

class TagProvider extends ChangeNotifier {
  List tags = [];
  final TagDatabaseService tagService = TagDatabaseService();

  Future<void> loadNotes(String userId) async {
    tags = await tagService.fetchTags(userId);
    notifyListeners();
  }

  Future<void> addNote(TagModel tag) async {
    await tagService.createTag(tag);
    tags.add(tag);
    notifyListeners();
  }

  Future<void> updateNote(TagModel tag) async {
    await tagService.updateTag(tag);
    int index = tags.indexWhere(
      (element) => element.id == tag.id,
    );
    if (index != -1) {
      tags[index] = tag;
      notifyListeners();
    }
  }

  Future<void> deleteNote(String tagId) async {
    await tagService.deleteTag(tagId);
    tags.removeWhere(
      (element) => element.id == tagId,
    );
    notifyListeners();
  }
}
