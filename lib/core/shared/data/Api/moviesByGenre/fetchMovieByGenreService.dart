import 'package:dio/dio.dart';

import '../../../domain/model/movieByGenreModel.dart';

import 'moviesByGenre.dart';

class FetchMoviesByGenreService {
  final MoviesByGenreApiService _api = MoviesByGenreApiService();

  Future<MovieByGenreModel?> getFetchedMoviesByGenreList() async {
    final Response? response = await _api.getMoviesByGenre();
    if (response != null) {
      return MovieByGenreModel.fromJson(response.data);
    }
    return null;
  }
}
