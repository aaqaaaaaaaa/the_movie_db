part of 'moviedb_bloc.dart';

@immutable
abstract class MovieDBState {}

class MovieDBInitial extends MovieDBState {}

class MovieDBLoadingState extends MovieDBState {}

class MovieDBLoadedState extends MovieDBState {
  final List<Results> movieList;

  MovieDBLoadedState({required this.movieList});
}

class MovieDBErrorState extends MovieDBState {}
