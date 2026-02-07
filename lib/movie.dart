class Movie {
  final int id;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String? posterPath; // รองรับกรณีหนังไม่มีรูป

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.posterPath,
  });

  // ฟังก์ชันแปลง JSON เป็น Object
  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        voteAverage = json['vote_average'] * 1.0,
        releaseDate = json['release_date'],
        posterPath = json['poster_path'];
}
