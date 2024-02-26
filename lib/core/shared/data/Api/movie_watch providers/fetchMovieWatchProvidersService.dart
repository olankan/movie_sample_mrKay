import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/model/movie_watch providers model/movieWatchProviders.model.dart';
import 'movieWatchProvidersApiService.dart';

class FetchMovieWatchProvidersService {
  final MovieWatchProvidersApiService _api = MovieWatchProvidersApiService();

  Future<MovieWatchProvidersModel?> getFetchedMovieWatchProvidersList(id) async {
    final Response? response = await _api.getMovieWatchProviders(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MovieWatchProvidersModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
