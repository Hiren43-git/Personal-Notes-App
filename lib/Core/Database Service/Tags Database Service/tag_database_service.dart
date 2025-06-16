import 'package:personal_notes_app/Core/Model/Tag%20Model/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TagDatabaseService {
  final client = Supabase.instance.client;

  Future<void> createTag(TagModel tag) async {
    await client.from('tags').insert({
      'tag_id': tag.id,
      'user_id': tag.userId,
      'name': tag.name,
    });
  }

  Future<List<TagModel>> fetchTags(String userId) async {
    final res = await client.from('tags').select().eq('user_id', userId);
    return res
        .map(
          (e) => TagModel(
            id: e['id'],
            userId: e['user_id'],
            name: e['name'],
          ),
        )
        .toList();
  }

  Future<void> updateTag(TagModel tag) async {
    await client.from('tags').update({
      'name': tag.name,
    }).eq(
      'note_id',
      tag.id,
    );
  }

  Future<void> deleteTag(String tagId) async {
    await client.from('tags').delete().eq(
          'tag_id',
          tagId,
        );
  }
}
