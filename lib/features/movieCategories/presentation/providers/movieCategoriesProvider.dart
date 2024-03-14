// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/core/shared/presentation/providers/sharedProviders.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/moviesByGenreProvider.dart';
import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

final onNavigateTo = StateProvider<String>((ref) => '');

final movieCategoryProvider = FutureProvider<List<MoviesVm>>((ref) async {
  final genreId = ref.watch(movieGenreID);
  final navigationFlag = ref.watch(onNavigateTo);

  try {
    FetchedMoviesListService _fetchedMoviesListService =
        FetchedMoviesListService();
    final movieId = ref.watch(movieID);

    switch (navigationFlag) {
      case 'popularMovies':
        return await _fetchedMoviesListService.getFetchedPopularMoviesList();
      case 'discoveredMovies':
        return await _fetchedMoviesListService.getFetchedDiscoveredMoviesList();
      case 'nowPlayingMovies':
        return await _fetchedMoviesListService.getFetchedNowPlayingMoviesList();
      case 'airingTodayMovies':
        return await _fetchedMoviesListService.getFetchedAiringTodayList();
      case 'popularTvShows':
        return await _fetchedMoviesListService.getFetchedPopularTvShowsList();
      case 'topRatedMovies':
        return await _fetchedMoviesListService.getFetchedTopRatedMoviesList();
      case 'upcomingMovies':
        return await _fetchedMoviesListService.getFetchedUpcomingMoviesList();
      case 'onTheAirShows':
        return await _fetchedMoviesListService.getFetchedOnTheAirTvShowsList();
      case 'moviesByGenre':
        return await _fetchedMoviesListService
            .getFetchedMoviesByGenreList(genreId);
      case 'recommendedMovies':
        return await _fetchedMoviesListService
            .getFetchedMovieRecommendationsList(movieId);
      default:
        return await _fetchedMoviesListService.getFetchedDiscoveredMoviesList();
    }
  } catch (e) {
    return [];
  }
});



// String heroTag(String screenName) {
//   switch (screenName) {
//     case 'popularMovies':
//       return 'popular movie image';
//     case 'nowPlayingMovies':
//       return 'now playing movie image';
//     case 'airingTodayMovies':
//       return 'airing today movie image';
//     case 'popularTvShows':
//       return 'popular TV show image';
//     case 'topRatedMovies':
//       return 'top rated movie image';
//     case 'upcomingMovies':
//       return 'upcoming movie image';
//     case 'moviesByGenre':
//       return 'movies by genre image';
//     default:
//       return 'default image';
//   }
// }
