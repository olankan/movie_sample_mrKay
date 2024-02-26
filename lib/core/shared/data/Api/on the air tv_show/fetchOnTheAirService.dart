import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/model/on_the_air%20model/onTheAirMovies.model.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'onTheAirTvShowsApiService.dart';

class FetchOnTheAirMoviesService {
  final OnTheAirMoviesApiService _api = OnTheAirMoviesApiService();

  Future<OnTheAirMoviesModel?> getFetchedOnTheAirMoviesList() async {
    final Response? response = await _api.getOnTheAirMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return OnTheAirMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
