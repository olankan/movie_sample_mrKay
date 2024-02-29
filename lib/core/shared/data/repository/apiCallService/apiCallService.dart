// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/data/Api/ApiCall/movieApiService.dart';

import '../../../../resources/constants.dart';
import '../../../domain/repository/apiCallServiceInterface/apiCallServiceInterface.dart';



class ApiCallService implements ApiCallServiceInterface {
  final MoviesApiService _moviesApiService = MoviesApiService();

  @override
  Future<Response?> getAiringToday() {
    final apiCall =
        _moviesApiService.call('$baseURL/tv/airing_today?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getMovieRecommendations(id) {
    final apiCall = _moviesApiService
        .call('$baseURL/movie/$id/recommendations?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getDiscoveredMovies() {
    final apiCall = _moviesApiService.call(discoverMoviesURL);
    return apiCall;
  }

  @override
  Future<Response?> getMoviesByGenre(id) {
    final apiCall = _moviesApiService
        .call('$baseURL/discover/movie?with_genres=$id&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getMovieCredits(id) {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/$id/credits?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getMovieReviews(id) {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/$id/reviews?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getMovieVideos(id) {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/$id/videos?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getMovieWatchProviders(id) {
    final apiCall = _moviesApiService
        .call('$baseURL/movie/$id/watch/providers?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getNowPlayingMovies() {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/now_playing?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getOnTheAirMovies() {
    final apiCall =
        _moviesApiService.call('$baseURL/tv/on_the_air?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getPopularMovies() {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/popular?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getPopularTvShows() {
    final apiCall =
        _moviesApiService.call('$baseURL/tv/popular?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getSimilarMovies(id) {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/$id/similar?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getTopRatedMovies() {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/top_rated?&api_key=$apiKey');
    return apiCall;
  }

  @override
  Future<Response?> getUpcomingMovies() {
    final apiCall =
        _moviesApiService.call('$baseURL/movie/upcoming?&api_key=$apiKey');
    return apiCall;
  }
}
