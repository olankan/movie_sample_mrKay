// import 'package:dio/dio.dart';
// import 'package:movie_sample/features/Home/data/data_sources/remote/movieApi/movieApiService.dart';
// import 'package:movie_sample/features/Home/data/models/movieGenreModel.dart';
// import 'package:movie_sample/features/Home/data/models/movieModel.dart';

// import 'movieGenreApiService.dart';

// class FetchMoviesGenreService {
//   final MovieGenreApiService _api = MovieGenreApiService();

//   Future<MovieGenreModel?> getFetchedMoviesGenreList() async {
//     final Response? response = await _api.fetchMoviesGenres();

//     if (response != null) {
//       return MovieGenreModel.fromJson(response.data);
//     }
//     return null;
//   }
// }