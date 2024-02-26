import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/models/now_playing movies model/nowPlayingMovies.model.dart';
import 'NowPlayingMoviesApiService.dart';

class FetchNowPlayingMoviesService {
  final NowPlayingMoviesApiService _api = NowPlayingMoviesApiService();

  Future<NowPlayingMoviesModel?> getFetchedNowPlayingMoviesList() async {
    final Response? response = await _api.getNowPlayingMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return NowPlayingMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
