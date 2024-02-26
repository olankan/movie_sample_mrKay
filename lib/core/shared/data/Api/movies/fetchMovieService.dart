import 'package:dio/dio.dart';

import '../../../domain/models/movie/movieModel.dart';
import 'movieApiService.dart';

class FetchMoviesService {
  final MoviesApiService _api = MoviesApiService();

  Future<MovieModel?> getFetchedMoviesList() async {
    final Response? response = await _api.fetchMovies();

    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  

  
}
