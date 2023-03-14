part of 'moviedb_bloc.dart';

@immutable
abstract class MovieDBEvent {}

class MovieLoadingEvent extends MovieDBEvent {}
