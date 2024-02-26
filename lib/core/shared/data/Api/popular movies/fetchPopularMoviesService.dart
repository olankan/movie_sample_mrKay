import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/models/popular%20movies%20model/popularMovies.model.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'PopularMoviesApiService.dart';

class FetchPopularMoviesService {
  final PopularMoviesApiService _api = PopularMoviesApiService();

  Future<PopularMoviesModel?> getFetchedPopularList() async {
    final Response? response = await _api.getPopularMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return PopularMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
