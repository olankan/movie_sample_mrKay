import 'package:dio/dio.dart';

import '../../../domain/model/movieGenreModel.dart';
import '../../../domain/model/movieModel.dart';
import '../movies/movieApiService.dart';
import 'moviesByGenre.dart';

class FetchMoviesService {
  final MoviesByGenreApiService _api = MoviesByGenreApiService();


  Future<MovieGenreModel?> getFetchedMoviesByGenreList() async {
    final Response? response = await _api.getMoviesByGenre();

    if (response != null) {

      return MovieGenreModel.fromJson(response.data);
    }
    return null;
  }
}
