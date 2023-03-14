import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/bloc/moviedb_bloc.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieDBBloc>(context).add(MovieLoadingEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDBBloc, MovieDBState>(
      builder: (context, state) {
        if (state is MovieDBLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieDBLoadedState) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<MovieDBBloc>(context).add(MovieLoadingEvent());
            },
            child: ListView.builder(
              itemCount: state.movieList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w342${state.movieList[index].posterPath}')),
                    title: Text(state.movieList[index].originalTitle ?? ''),
                    subtitle: Text(
                      state.movieList[index].overview ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: Text('No data.Press button "Load"'),
        );
      },
    );
  }
}
