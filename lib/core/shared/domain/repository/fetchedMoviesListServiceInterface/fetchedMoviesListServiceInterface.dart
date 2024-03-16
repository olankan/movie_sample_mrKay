// ignore_for_file: file_names

import '../../../presentation/view models/movie credits vm/movieCredits.vm.dart';
import '../../../presentation/view models/movie reviews vm/movieReviews.vm.dart';
import '../../../presentation/view models/movieVideos vm/movieVideos.vm.dart';
import '../../../presentation/view models/movie_watch providers vm/movieWatchProviders.vm.dart';
import '../../../presentation/view models/movies vm/moviesVm.dart';


abstract class FetchedMoviesListServiceInterface {
  Future<List<MoviesVm>> getFetchedAiringTodayList();
  Future<List<MoviesVm>> getFetchedUpcomingMoviesList();
  Future<List<MoviesVm>> getFetchedTopRatedMoviesList();
  Future<List<MoviesVm>> getFetchedSimilarMoviesList(id);
  Future<List<MoviesVm>> getFetchedPopularTvShowsList();
  Future<List<MoviesVm>> getFetchedNowPlayingMoviesList();
  Future<List<MoviesVm>> getFetchedDiscoveredMoviesList();
  Future<List<MoviesVm>> getFetchedMoviesByGenreList(id);
  Future<List<MoviesVm>> getFetchedMovieRecommendationsList(id);
  Future<List<MoviesVm>> getFetchedPopularMoviesList();
  Future<List<MoviesVm>> getFetchedOnTheAirTvShowsList();
  Future<List<MovieCreditsVm>> getFetchedMovieCastCreditsList(id);
  Future<List<MovieCreditsVm>> getFetchedMovieCrewCreditsList(id);
  Future<List<MovieReviewsVm>> getFetchedMovieReviewsList(id);
  Future<List<MovieVideoVm>> getFetchedMovieVideosList(id);
  Future<List<MovieWatchProvidersVm>> getFetchedMovieWatchProvidersList(id);
}