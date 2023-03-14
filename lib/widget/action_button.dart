import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/bloc/moviedb_bloc.dart';
import 'package:the_movie_db/services/movie_provider.dart';

class ActionButton extends StatelessWidget {
   ActionButton({Key? key}) : super(key: key);
  MovieProvider movieProvider = MovieProvider();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {
          BlocProvider.of<MovieDBBloc>(context).add(MovieLoadingEvent());
          movieProvider.getMovie();
        }, child: const Text('Load')),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Clear'))
      ],
    );
  }
}
