class ImpressionNote{
  final  int id;
  final  int seriesId;
  final String? description;
  final DateTime createdAt;

  ImpressionNote({
    required this.id,
    required this.seriesId,
    this.description,
    DateTime? createdAt
  }): createdAt = createdAt?? DateTime.now();

  ImpressionNote copyWith({String? description}) {
    return ImpressionNote(
      id: id,
      seriesId: seriesId,
      description: description ?? this.description,
      createdAt: DateTime.now(),
    );
  }
}