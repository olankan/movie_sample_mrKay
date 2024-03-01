import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

FetchedMoviesListService _fetchedMoviesListService = FetchedMoviesListService();

final nowPlayingMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedNowPlayingMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final popularMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedPopularMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final upComingMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedUpcomingMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final airingTodayProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedAiringTodayList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final onTheAirTvShowsProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedOnTheAirTvShowsList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final topRatedMoviesProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedTopRatedMoviesList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});

final popularTvShowsProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    return await _fetchedMoviesListService.getFetchedPopularTvShowsList();
  } catch (e, stackTrace) {
    print('Error fetching movies by genre: $e\n$stackTrace');
    return [];
  }
});
