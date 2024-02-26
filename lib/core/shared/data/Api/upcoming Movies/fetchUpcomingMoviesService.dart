import 'package:dio/dio.dart';

import '../../../../../features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';

import '../../../domain/models/upcoming movies model/upcomingMovies.model.dart';
import 'upcomingMoviesApiService.dart';

class FetchUpcomingMoviesService {
  final UpcomingMoviesApiService _api = UpcomingMoviesApiService();

  Future<UpcomingMoviesModel?> getFetchedUpcomingMoviesList() async {
    final Response? response = await _api.getUpcomingMovies();
    // print(response!.data);
    try {
         if (response != null) {
      return UpcomingMoviesModel.fromJson(response.data);
    }
    } catch (e) {
      print('Error is $e');
    }
 
    return null;
  }
}
