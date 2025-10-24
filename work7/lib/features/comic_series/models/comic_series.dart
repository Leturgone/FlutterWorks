class ComicSeries{
  final  int id;
  final String title;
  final String? description;
  final String image;
  final String writer;

  ComicSeries({
    required this.id,
    required this.title,
    this.description,
    required this.image,
    required this.writer
  });

}
