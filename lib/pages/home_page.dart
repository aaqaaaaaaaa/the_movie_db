import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/bloc/moviedb_bloc.dart';

import '../services/movie_repository.dart';
import '../widget/movie_list.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  MovieRepository movieRepository = MovieRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDBBloc(movieRepository: movieRepository),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('The Movie DB'),
        ),
        body: Column(
          children: const [ Expanded(child: MovieList())],
        ),
      ),
    );
  }
}
