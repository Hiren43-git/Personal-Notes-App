import 'package:personal_notes_app/Core/Model/Note%20Model/note_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteDatabaseService {
  final client = Supabase.instance.client;

  Future<void> createNote(NoteModel note) async {
    await client.from('notes').insert({
      'note_id': note.id,
      'user_id': note.userId,
      'title': note.title,
      'content': note.content,
      'tags': note.tags,
      'createdDate': note.createdDate.toString(),
      'updatedDate': note.updatedDate.toString(),
    });
  }

  Future<List<NoteModel>> fetchNotes(String userId) async {
    final res = await client.from('notes').select().eq('user_id', userId);
    return res
        .map(
          (e) => NoteModel(
            id: e['note_id'],
            userId: e['user_id'],
            title: e['title'],
            content: e['content'],
            tags: List.from(e['tags'] ?? []),
            createdDate: DateTime.parse(
              e['createdDate'],
            ),
            updatedDate: DateTime.parse(
              e['updatedDate'],
            ),
          ),
        )
        .toList();
  }

  Future<void> updateNote(NoteModel note) async {
    await client.from('notes').update({
      'title': note.title,
      'content': note.content,
      'tags': note.tags,
      'updatedDate': note.updatedDate,
    }).eq('note_id', note.id);
  }

  Future<void> deleteNote(String noteId) async {
    await client.from('notes').delete().eq(
          'note_id',
          noteId,
        );
  }
}
