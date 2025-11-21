class Game {
  final int id;
  final String title;
  final String? description;
  final String image;
  final String developer;
  final String platform;

  Game({
    required this.id,
    required this.title,
    this.description,
    required this.image,
    required this.developer,
    required this.platform,
  });
}