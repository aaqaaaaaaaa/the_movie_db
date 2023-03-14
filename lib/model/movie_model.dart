// class TheMovieDB {
//   List<Results>? results;
//
//   TheMovieDB({this.results});
//
//   factory TheMovieDB.fromJson(Map<String, dynamic> json) {
//     return TheMovieDB(
//       results: (json['results'] as List<dynamic>)
//           .map((e) => Results.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }
//
// class Results {
//   int? id;
//   String? originalTitle;
//   String? overview;
//   String? posterPath;
//
//   Results({
//     this.id,
//     this.originalTitle,
//     this.overview,
//     this.posterPath,
//   });
//
//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     posterPath = json['poster_path'];
//   }
// }
class TheMovieDB {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TheMovieDB({this.page, this.results, this.totalPages, this.totalResults});

  TheMovieDB.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  // int? voteAverage;
  int? voteCount;

  Results({this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    // this.voteAverage,
    this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    // voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}