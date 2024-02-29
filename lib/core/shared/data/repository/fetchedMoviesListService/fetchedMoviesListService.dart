// ignore_for_file: file_names


import 'package:movie_sample/core/shared/data/repository/fetchedApiCallService/fetchedApiCallService.dart';
import 'package:movie_sample/core/shared/domain/repository/fetchedMoviesListServiceInterface/fetchedMoviesListServiceInterface.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movie%20credits%20vm/movieCredits.vm.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movie%20reviews%20vm/movieReviews.vm.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movieVideos%20vm/movieVideos.vm.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movie_watch%20providers%20vm/movieWatchProviders.vm.dart';

import '../../../presentation/view models/movies vm/moviesVm.dart';

class FetchedMoviesListService implements FetchedMoviesListServiceInterface {
  final FetchedMoviesApiService _fetchedApiMovies =   FetchedMoviesApiService();


  @override
  Future<List<MoviesVm>> getFetchedAiringTodayList() async {
    var res = await _fetchedApiMovies.getFetchedAiringToday();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedDiscoveredMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedDiscoveredMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MovieCreditsVm>> getFetchedMovieCreditsList(id) async {
    var res = await _fetchedApiMovies.getFetchedMovieCredits(id);
    return res!.cast!.map((e) => MovieCreditsVm(cast: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedMovieRecommendationsList(id) async {
    var res = await _fetchedApiMovies.getFetchedMovieRecommendations(id);
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MovieReviewsVm>> getFetchedMovieReviewsList(id) async {
    var res = await _fetchedApiMovies.getFetchedMovieReviews(id);
    return res!.results!.map((e) => MovieReviewsVm(review: e)).toList();
  }

  @override
  Future<List<MovieVideoVm>> getFetchedMovieVideosList(id) async {
    var res = await _fetchedApiMovies.getFetchedMovieVideos(id);
    return res!.results!.map((e) => MovieVideoVm(video: e)).toList();
  }

  @override
  Future<List<MovieWatchProvidersVm>> getFetchedMovieWatchProvidersList(
      id) async {
    var res = await _fetchedApiMovies.getFetchedMovieWatchProviders(id);
    return res!.results!.au!.buy!
        .map((e) => MovieWatchProvidersVm(watchProviders: e))
        .toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedMoviesByGenreList(id) async {
    var res = await _fetchedApiMovies.getFetchedMoviesByGenre(id);
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedNowPlayingMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedNowPlayingMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedOnTheAirMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedOnTheAirMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedPopularMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedPopularMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedPopularTvShowsList() async {
    var res = await _fetchedApiMovies.getFetchedPopularTvShows();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedSimilarMoviesList(id) async {
    var res = await _fetchedApiMovies.getFetchedSimilarMovies(id);
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedTopRatedMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedTopRatedMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  @override
  Future<List<MoviesVm>> getFetchedUpcomingMoviesList() async {
    var res = await _fetchedApiMovies.getFetchedUpcomingMovies();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }
}
