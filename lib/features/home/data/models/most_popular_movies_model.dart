
class MostPopularMoviesModel {
  final int rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<String> genre;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String imdbid;
  final String imdbLink;

  MostPopularMoviesModel({
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

  factory MostPopularMoviesModel.fromJson(Map<String, dynamic> json) => MostPopularMoviesModel(
    rank: json["rank"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    bigImage: json["big_image"],
    genre: List<String>.from(json["genre"].map((x) => x)),
    thumbnail: json["thumbnail"],
    rating: json["rating"],
    id: json["id"],
    year: json["year"],
    imdbid: json["imdbid"],
    imdbLink: json["imdb_link"],
  );
}
