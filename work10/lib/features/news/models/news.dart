class News {
  final int id;
  final String title;
  final String? description;
  final String image;
  final DateTime date;
  final String author;

  News({
    required this.id,
    required this.title,
    this.description,
    required this.image,
    required this.date,
    required this.author,
  });
}