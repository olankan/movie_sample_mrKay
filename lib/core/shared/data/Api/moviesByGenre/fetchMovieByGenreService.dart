import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'moviesByGenreApiService.dart';

class FetchMoviesByGenreService {
  final MoviesByGenreApiService _api = MoviesByGenreApiService();

  Future<MoviesByGenreModel?> getFetchedMoviesByGenreList(id) async {
    final Response? response = await _api.getMoviesByGenre(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MoviesByGenreModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
