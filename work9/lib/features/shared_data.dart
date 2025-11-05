
import 'comic_series/models/comic_series.dart';

class SharedData {
  static List<ComicSeries> seriesList = [
    ComicSeries(
        id: 1,
        title: "Iron Man (1968 - 1996)",
        image: "https://i.annihil.us/u/prod/marvel/i/mg/1/d0/519bad24bebcd.jpg",
        writer: "Dan Abnett"),
    ComicSeries(
        id: 2,
        title: "Ultimate Spider-Man (2024 - Present)",
        description: "THE NEW ULTIMATE SPIDER-MAN FOR A NEW ULTIMATE UNIVERSE! Visionary writer Jonathan Hickman (HOUSE OF X/POWERS OF X) and acclaimed artist Marco Checchetto (DAREDEVIL) bring you a bold new take on Spider-Man, with this, the debut title of the new line of Ultimate Comics! After the events of ULTIMATE INVASION, the world needs a hero…who will rise up to take on that responsibility? Prepare to be entangled in a web of mystery and excitement as the all-new ULTIMATE SPIDER-MAN comic redefines the wall-crawler for the 21st Century!",
        image: "https://cdn.marvel.com/u/prod/marvel/i/mg/4/90/659c61377f79c/standard_incredible.jpg",
        writer: "Jonathan Hickman")
  ];
}