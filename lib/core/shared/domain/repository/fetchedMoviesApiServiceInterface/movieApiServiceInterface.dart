import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/domain/models/movie%20credits%20model/movieCredits.model.dart';
import 'package:movie_sample/core/shared/domain/models/movie%20reviews%20model/movieReviews.model.dart';
import 'package:movie_sample/core/shared/domain/models/movie/movieModel.dart';
import 'package:movie_sample/core/shared/domain/models/movieVideos%20model/movieVideos.model.dart';
import 'package:movie_sample/core/shared/domain/models/movie_watch%20providers%20model/movieWatchProviders.model.dart';

abstract class FetchedMoviesApiServiceInterface {
  Future<MovieModel?> getFetchedAiringToday();
  Future<MovieModel?> getFetchedUpcomingMovies();
  Future<MovieModel?> getFetchedTopRatedMovies();
  Future<MovieModel?> getFetchedSimilarMovies(id);
  Future<MovieModel?> getFetchedPopularTvShows();
  Future<MovieModel?> getFetchedNowPlayingMovies();
  Future<MovieModel?> getFetchedDiscoveredMovies();
  Future<MovieModel?> getFetchedMoviesByGenre(id);
  Future<MovieModel?> getFetchedMovieRecommendations(id);
  Future<MovieModel?> getFetchedPopularMovies();
  Future<MovieModel?> getFetchedOnTheAirMovies();
  Future<MovieCreditsModel?> getFetchedMovieCredits(id);
  Future<MovieReviewsModel?> getFetchedMovieReviews(id);
  Future<MovieVideosModel?> getFetchedMovieVideos(id);
  Future<MovieWatchProvidersModel?> getFetchedMovieWatchProviders(id);
}
