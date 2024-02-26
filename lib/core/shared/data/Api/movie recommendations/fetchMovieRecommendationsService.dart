import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/models/movie%20recommendations/movie_recomendations.model.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'movieRecommendationsApiService.dart';

class FetchMovieRecommendationsService {
  final MoviesRecommendationsApiService _api = MoviesRecommendationsApiService();

  Future<MovieRecommendationsModel?> getFetchedMovieRecommendations(id) async {
    final Response? response = await _api.getMovieRecommendations(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MovieRecommendationsModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
