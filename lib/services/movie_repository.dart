import 'package:the_movie_db/model/movie_model.dart';
import 'package:the_movie_db/services/movie_provider.dart';

class MovieRepository {
  MovieProvider movieProvider = MovieProvider();

  Future<List<Results>> getMovieProvider() => movieProvider.getMovie();
}
