class ImpressionNote{
  final  int id;
  final  String seriesImage;
  final String description;
  final DateTime createdAt;

  ImpressionNote({
    required this.id,
    required this.seriesImage,
    required this.description,
    DateTime? createdAt
  }): createdAt = createdAt?? DateTime.now();

  ImpressionNote copyWith({String? description}) {
    return ImpressionNote(
      id: id,
      seriesImage: seriesImage,
      description: description ?? this.description,
      createdAt: DateTime.now(),
    );
  }
}