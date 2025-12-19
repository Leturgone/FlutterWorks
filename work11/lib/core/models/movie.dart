class Movie {
  final int id;
  final String title;
  final String? description;
  final String image;
  final String director;
  final int year;

  Movie({
    required this.id,
    required this.title,
    this.description,
    required this.image,
    required this.director,
    required this.year,
  });
}