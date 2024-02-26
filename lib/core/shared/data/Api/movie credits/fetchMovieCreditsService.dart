import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/model/movie credits model/movieCredits.model.dart';
import 'movieCreditsApiService.dart';

class FetchMovieCreditsService {
  final MovieCreditsApiService _api = MovieCreditsApiService();

  Future<MovieCreditsModel?> getFetchedMovieCreditsList(id) async {
    final Response? response = await _api.getMovieCredits(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MovieCreditsModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
