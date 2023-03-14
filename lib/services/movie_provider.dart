import 'dart:convert';

import 'package:the_movie_db/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  Future<List<Results>> getMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=fab3626d9e8d767dbf679f3c64849db5&append_to_response=videos&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=True&page=1'));
    if (response.statusCode == 200) {
      final movieJson = json.decode(response.body);
      final m = TheMovieDB.fromJson(movieJson);
      // final movie = movieJson
      //     .map((Map<String,dynamic> json) =>
      //         TheMovieDB.fromJson(json))
      //     .toList();
      // print(m.results![1].id);
      return  m.results!.toList();
    } else {
      throw Exception('Error url');
    }
  }
}
