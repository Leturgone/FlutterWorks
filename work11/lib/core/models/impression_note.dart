class ImpressionNote{
  final  int id;
  final  String image;
  final String description;
  final DateTime createdAt;

  ImpressionNote({
    required this.id,
    required this.image,
    required this.description,
    DateTime? createdAt
  }): createdAt = createdAt?? DateTime.now();

  ImpressionNote copyWith({String? description}) {
    return ImpressionNote(
      id: id,
      image: image,
      description: description ?? this.description,
      createdAt: DateTime.now(),
    );
  }
}