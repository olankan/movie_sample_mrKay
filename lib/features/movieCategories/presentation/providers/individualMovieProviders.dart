// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movie_watch%20providers%20vm/movieWatchProviders.vm.dart';

import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/providers/sharedProviders.dart';
import '../../../../core/shared/presentation/view models/movie credits vm/movieCredits.vm.dart';
import '../../../../core/shared/presentation/view models/movie reviews vm/movieReviews.vm.dart';
import '../../../../core/shared/presentation/view models/movieVideos vm/movieVideos.vm.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

FetchedMoviesListService _fetchedMoviesListService = FetchedMoviesListService();



final nowPlayingMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedNowPlayingMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching now playing movies list: $e\n$stackTrace');
    return [];
  }
});

final popularMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedPopularMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching popular movies  list: $e\n$stackTrace');
    return [];
  }
});

final upComingMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedUpcomingMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching upcoming movies list: $e\n$stackTrace');
    return [];
  }
});

final airingTodayProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedAiringTodayList();
  } catch (e, stackTrace) {
    print('Error fetching airing today shows list: $e\n$stackTrace');
    return [];
  }
});

final onTheAirTvShowsProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedOnTheAirTvShowsList();
  } catch (e, stackTrace) {
    print('Error fetching on the air tv shows list: $e\n$stackTrace');
    return [];
  }
});

final topRatedMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedTopRatedMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching top rated movies list: $e\n$stackTrace');
    return [];
  }
});

final popularTvShowsProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedPopularTvShowsList();
  } catch (e, stackTrace) {
    print('Error fetching popular tv shows list: $e\n$stackTrace');
    return [];
  }
});

final movieCastCreditsProvider = FutureProvider<List<MovieCreditsVm>>((ref) async {
  try {
    final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedMovieCastCreditsList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie cast credits list: $e\n$stackTrace');
    return [];
  }
});

final movieCrewCreditsProvider = FutureProvider<List<MovieCreditsVm>>((ref) async {
  try {
    final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedMovieCrewCreditsList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie crew credits list: $e\n$stackTrace');
    return [];
  }
});

final movieVideosProvider = FutureProvider<List<MovieVideoVm>>((ref) async {
  try {
        final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedMovieVideosList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie videos list: $e\n$stackTrace');
    return [];
  }
});

final movieReviewsProvider = FutureProvider<List<MovieReviewsVm>>((ref) async {
  try {
        final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedMovieReviewsList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie reviews list: $e\n$stackTrace');
    return [];
  }
});

final movieWatchProvider = FutureProvider<List<MovieWatchProvidersVm>>((ref) async {
  try {
        final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedMovieWatchProvidersList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie watch list: $e\n$stackTrace');
    return [];  
  }
});

final similarMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
        final id = ref.watch(movieID);
    return await _fetchedMoviesListService.getFetchedSimilarMoviesList(id);
  } catch (e, stackTrace) {
    print('Error fetching similar movies list: $e\n$stackTrace');
    return [];
  }
});

final movieRecommendationsProvider =
    FutureProvider<List<MoviesVm>>((ref) async {
       final id = ref.watch(movieID);
  try {
    return await _fetchedMoviesListService
        .getFetchedMovieRecommendationsList(id);
  } catch (e, stackTrace) {
    print('Error fetching movie recommendations list: $e\n$stackTrace');
    return [];
  }
});
