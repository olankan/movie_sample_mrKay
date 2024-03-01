// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/moviesByGenreProvider.dart';
import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

final onNavigateToPopularMovies = StateProvider<bool>((ref) => false);
final onNavigateToNowPlayingMovies = StateProvider<bool>((ref) => false);
final onNavigateToAiringTodayMovies = StateProvider<bool>((ref) => false);
final onNavigateToPopularTvShows = StateProvider<bool>((ref) => false);
final onNavigateToTopRatedMovies = StateProvider<bool>((ref) => false);
final onNavigateToOnTheAirMovies = StateProvider<bool>((ref) => false);
final onNavigateToUpComingMovies = StateProvider<bool>((ref) => false);
final onNavigateToDiscoveredMovies = StateProvider<bool>((ref) => false);
final onNavigateToMoviesByGenre = StateProvider<bool>((ref) => false);

final movieCategoryProvider = FutureProvider<List<MoviesVm>>((ref) async {
  final genreId = ref.watch(movieGenreID);
  final movieId = ref.watch(movieID);

  final navigatedToPopularMovies = ref.watch(onNavigateToPopularMovies);
  final navigatedToNowPlayingMovies = ref.watch(onNavigateToNowPlayingMovies);
  final navigatedToOnTheAirMovies = ref.watch(onNavigateToOnTheAirMovies);
  final navigatedToAiringTodayMovies = ref.watch(onNavigateToAiringTodayMovies);
  final navigatedToTopRatedMovies = ref.watch(onNavigateToTopRatedMovies);
  final navigatedToUpComingMovies = ref.watch(onNavigateToUpComingMovies);
  final navigatedToPopularTvShows = ref.watch(onNavigateToPopularTvShows);
  final navigatedToMoviesByGenre = ref.watch(onNavigateToMoviesByGenre);

  try {
    FetchedMoviesListService _fetchedMoviesListService =
        FetchedMoviesListService();

    return navigatedToMoviesByGenre == true
        ? await _fetchedMoviesListService.getFetchedMoviesByGenreList(genreId)
        : navigatedToPopularTvShows == true
            ? await _fetchedMoviesListService.getFetchedPopularTvShowsList()
            : navigatedToUpComingMovies == true
                ? await _fetchedMoviesListService.getFetchedUpcomingMoviesList()
                : navigatedToAiringTodayMovies == true
                    ? await _fetchedMoviesListService
                        .getFetchedAiringTodayList()
                    : navigatedToTopRatedMovies == true
                        ? await _fetchedMoviesListService
                            .getFetchedTopRatedMoviesList()
                        : navigatedToNowPlayingMovies == true
                            ? await _fetchedMoviesListService
                                .getFetchedNowPlayingMoviesList()
                            : navigatedToOnTheAirMovies == true
                                ? await _fetchedMoviesListService
                                    .getFetchedOnTheAirTvShowsList()
                                : navigatedToPopularMovies == true
                                    ? await _fetchedMoviesListService
                                        .getFetchedPopularMoviesList()
                                    : await _fetchedMoviesListService
                                        .getFetchedDiscoveredMoviesList();
  } catch (e) {
    return [];
  }
});

final movieID = StateProvider<int?>((ref) => null);
