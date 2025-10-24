import 'package:flutter/material.dart';
import 'package:work7/features/gallery/screens/comic_gallery_screen.dart';


enum Screen { gallery}

class ComicGalleryContainer extends StatefulWidget {
  const ComicGalleryContainer({super.key});


  @override
  State<ComicGalleryContainer> createState() => _ComicGalleryContainerState();
}

class _ComicGalleryContainerState extends State<ComicGalleryContainer> {
  final List<String> imageUrls = [
    "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/90/659c61377f79c/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/6/f0/68c053ab8d985/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/60/68e6a1293e977/standard_incredible.jpg",
    "https://cdn.marvel.com/u/prod/marvel/i/mg/4/80/575ef36168a99/standard_incredible.jpg"
  ];

  final Screen _currentScreen = Screen.gallery;


  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.gallery:
        return ComicGalleryScreen(imageUrls: imageUrls);
    }
  }
}