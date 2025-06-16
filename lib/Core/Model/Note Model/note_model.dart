class NoteModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final List tags;
  final DateTime createdDate;
  final DateTime updatedDate;

  NoteModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.tags,
    required this.createdDate,
    required this.updatedDate,
  });

  factory NoteModel.fromMap(Map m1) {
    return NoteModel(
      id: m1['id'],
      userId: m1['userId'],
      title: m1['title'],
      content: m1['content'],
      tags: m1['tags'],
      createdDate: m1['createdDate'],
      updatedDate: m1['updatedDate'],
    );
  }
}
