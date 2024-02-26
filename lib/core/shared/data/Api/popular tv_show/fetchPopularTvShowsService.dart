import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/model/popular_tv%20model/PopularTv.model.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import 'PopularTvShowApiService.dart';

class FetchPopularTvShowsService {
  final PopularTvShowsApiService _api = PopularTvShowsApiService();

  Future<PopularTvShowsModel?> getPopularTvShowsList() async {
    final Response? response = await _api.getPopularTvShows();
    // print(response!.data);
    try {
         if (response != null) {
      return PopularTvShowsModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
