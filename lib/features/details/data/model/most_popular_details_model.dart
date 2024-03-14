class MostPopularDetailsModel {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String image;
  final String bigImage;
  final String description;
  final String trailer;
  final String trailerEmbedLink;
  final String trailerYoutubeId;
  final List<String> genre;
  final List<String> director;
  final List<String> writers;
  final String imdbid;
  final String imdbLink;

  MostPopularDetailsModel({
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
    required this.director,
    required this.writers,
    required this.imdbid,
    required this.imdbLink,
  });

  factory MostPopularDetailsModel.fromJson(Map<String, dynamic> json) => MostPopularDetailsModel(
    rank: json["rank"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    rating: json["rating"],
    id: json["id"],
    year: json["year"],
    image: json["image"],
    bigImage: json["big_image"],
    description: json["description"],
    trailer: json["trailer"],
    trailerEmbedLink: json["trailer_embed_link"],
    trailerYoutubeId: json["trailer_youtube_id"],
    genre: List<String>.from(json["genre"].map((x) => x)),
    director: List<String>.from(json["director"].map((x) => x)),
    writers: List<String>.from(json["writers"].map((x) => x)),
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
    "director": List<dynamic>.from(director.map((x) => x)),
    "writers": List<dynamic>.from(writers.map((x) => x)),
    "imdbid": imdbid,
    "imdb_link": imdbLink,
  };
}
