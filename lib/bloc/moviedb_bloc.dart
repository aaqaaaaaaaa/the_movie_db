import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:the_movie_db/model/movie_model.dart';

import '../services/movie_repository.dart';

part 'moviedb_event.dart';

part 'moviedb_state.dart';

class MovieDBBloc extends Bloc<MovieDBEvent, MovieDBState> {
  MovieRepository movieRepository;

  MovieDBBloc({required this.movieRepository}) : super(MovieDBInitial()) {
    on<MovieDBEvent>((event, emit) {
      emit(MovieDBLoadingState());
    });
    on<MovieLoadingEvent>((event, emit) async {
      emit(MovieDBLoadingState());
      try {
        final List<Results> _loadedUserList =
            await movieRepository.getMovieProvider();
        // print(_loadedUserList.length);
        emit(MovieDBLoadedState(movieList: _loadedUserList));
      } catch (_) {
        throw Exception('Error');
      }
    });
  }
}
