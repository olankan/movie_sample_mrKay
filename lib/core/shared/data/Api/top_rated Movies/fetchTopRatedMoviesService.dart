import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/model/top_rated movies/topRatedMovies.model.dart';
import 'topRatedMoviesApiService.dart';

class FetchTopRatedMoviesService {
  final TopRatedMoviesApiService _api = TopRatedMoviesApiService();

  Future<TopRatedMoviesModel?> getFetchedTopRatedMoviesList() async {
    final Response? response = await _api.getTopRatedMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return TopRatedMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
