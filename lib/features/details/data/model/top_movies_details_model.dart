class TopMoviesDetailsModel {
  final int rank;
  final String title;
  final String thumbnail;
  final double rating;
  final String id;
  final String year;
  final String image;
  final String bigImage;
  final String description;
  final String trailer;
  final String trailerEmbedLink;
  final String trailerYoutubeId;
  final List<String> genre;
  final String imdbid;
  final String imdbLink;

  TopMoviesDetailsModel({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.bigImage,
    required this.description,
    required this.trailer,
    required this.trailerEmbedLink,
    required this.trailerYoutubeId,
    required this.genre,
    required this.imdbid,
    required this.imdbLink,
  });

  factory TopMoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      TopMoviesDetailsModel(
        rank: json["rank"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        rating: json["rating"]?.toDouble(),
        id: json["id"],
        year: json["year"],
        image: json["image"],
        bigImage: json["big_image"],
        description: json["description"],
        trailer: json["trailer"],
        trailerEmbedLink: json["trailer_embed_link"],
        trailerYoutubeId: json["trailer_youtube_id"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        imdbid: json["imdbid"],
        imdbLink: json["imdb_link"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "title": title,
        "thumbnail": thumbnail,
        "rating": rating,
        "id": id,
        "year": year,
        "image": image,
        "big_image": bigImage,
        "description": description,
        "trailer": trailer,
        "trailer_embed_link": trailerEmbedLink,
        "trailer_youtube_id": trailerYoutubeId,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "imdbid": imdbid,
        "imdb_link": imdbLink,
      };
}
