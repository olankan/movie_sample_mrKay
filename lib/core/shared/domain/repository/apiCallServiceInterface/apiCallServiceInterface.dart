import 'package:dio/dio.dart';

abstract class ApiCallServiceInterface {
  Future<Response?> getUpcomingMovies();
  Future<Response?> getAiringToday();
  Future<Response?> getTopRatedMovies();
  Future<Response?> getSimilarMovies(id);
  Future<Response?> getPopularTvShows();
  Future<Response?> getNowPlayingMovies();
  Future<Response?> getDiscoveredMovies();
  Future<Response?> getMovieRecommendations(id);
  Future<Response?> getMoviesByGenre(id);
  Future<Response?> getPopularMovies();
  Future<Response?> getOnTheAirMovies();
  Future<Response?> getMovieCredits(id);
  Future<Response?> getMovieReviews(id);
  Future<Response?> getMovieVideos(id);
  Future<Response?> getMovieWatchProviders(id);
}
 