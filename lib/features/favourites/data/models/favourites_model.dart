import 'dart:convert';

class FavouritesModel {
  final String title;
  final String email;
  final String year;
  final String rating;
  final String image;
  final String isFavourite;
  final List<String> sorting;

  FavouritesModel( {
    required this.title,
    required this.email,
    required this.year,
    required this.rating,
    required this.image,
    required this.isFavourite,
    required this.sorting,
  });


  Map<String, dynamic> toJson() => {
    "title": title,
    "email":email,
    "year": year,
    "rating": rating,
    "image": image,
    "isFavourite": isFavourite,
    "sorting":jsonEncode(sorting)
  };

}