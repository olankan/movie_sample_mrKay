import 'package:dio/dio.dart';
import 'package:movie_sample/core/coreApi/movieApi.dart';
import 'package:movie_sample/core/models/movieModel.dart';

class FetchMovieService {
  final MovieApi _api = MovieApi();

  Future<MovieModel?> getMovies() async {
    final Response? response = await _api.fetchMovies();

    if (response != null) {
      // List<MovieModel> movies = [];
      // print('${response.data['Title']}');
      return MovieModel.fromJson(response.data);
      // [];
      // List<MovieModel>.from(response.data.map((e) => MovieModel.fromJson(e as Map<String, dynamic>)));
    }
    return null;
  }
}
