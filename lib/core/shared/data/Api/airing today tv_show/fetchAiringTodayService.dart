import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/model/airingToday model/AiringToday.model.dart';
import 'AiringToday_TvShow.dart';

class FetchAiringTodayService {
  final AiringTodayApiService _api = AiringTodayApiService();

  Future<AiringTodayModel?> getFetchedAiringTodayMoviesList() async {
    final Response? response = await _api.getAiringTodayMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return AiringTodayModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
