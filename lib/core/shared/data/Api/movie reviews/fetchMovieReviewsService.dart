import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/models/movie reviews model/movieReviews.model.dart';
import 'moviesReviewsApiService.dart';

class FetchMovieReviewsService {
  final MovieReviewsApiService _api = MovieReviewsApiService();

  Future<MovieReviewsModel?> getFetchedMovieReviewsList(id) async {
    final Response? response = await _api.getMovieReviews(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MovieReviewsModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
