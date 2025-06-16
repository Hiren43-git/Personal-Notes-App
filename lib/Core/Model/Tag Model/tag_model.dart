class TagModel {
  final String id;
  final String userId;
  final String name;

  TagModel({
    required this.id,
    required this.userId,
    required this.name,
  });

  factory TagModel.fromMap(Map m1) {
    return TagModel(
      id: m1['id'],
      userId: m1['userId'],
      name: m1['name'],
    );
  }
}
