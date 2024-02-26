import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/models/similarMovies%20model/similarMovies.model.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'similarMoviesApiService.dart';

class FetchMoviesByGenreService {
  final SimilarMoviesApiService _api = SimilarMoviesApiService();

  Future<SimilarMoviesModel?> getFetchedSimilarMoviesList(id) async {
    final Response? response = await _api.getSimilarMovies(id);
    // print(response!.data);
    try {
         if (response != null) {
      return SimilarMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
      
    }
 
    return null;
  }
}
