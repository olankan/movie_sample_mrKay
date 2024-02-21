import 'package:dio/dio.dart';
import 'package:movie_sample/features/Home/data/models/movieModel.dart';

import 'movieApiService.dart';

class FetchMoviesService {
  final MovieS_ApiService _api = MovieS_ApiService();

  Future<MovieModel?> getFetchedMoviesList() async {
    final Response? response = await _api.fetchMovies();

    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }
}
