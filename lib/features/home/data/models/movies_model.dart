


class MoviesModel {
  final int rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<String> genre;
  final String thumbnail;
  final double rating;
  final String id;
  final String year;
  final String imdbid;
  final String imdbLink;

  MoviesModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    rank: json["rank"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    bigImage: json["big_image"],
    genre: List<String>.from(json["genre"].map((x) => x)),
    thumbnail: json["thumbnail"],
    rating: json["rating"]?.toDouble(),
    id: json["id"],
    year: json["year"],
    imdbid: json["imdbid"],
    imdbLink: json["imdb_link"],
  );

}
