import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/model/movieVideos model/movieVideos.model.dart';
import 'movieVideosApiService.dart';

class FetchMovieVideosService {
  final MovieVideosApiService _api = MovieVideosApiService();

  Future<MovieVideosModel?> getFetchedMovieVideosList(id) async {
    final Response? response = await _api.getMovieVideos(id);
    // print(response!.data);
    try {
         if (response != null) {
      return MovieVideosModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
