import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import '../../data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';

final movieProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    FetchedMoviesListService _fetchedMoviesListService =
        FetchedMoviesListService();
    return await _fetchedMoviesListService.getFetchedDiscoveredMoviesList();
  } catch (e) {
    print(e);
    return [];
  }
});

final movieIndex = StateProvider<int?>((ref) => 0);
final movieID = StateProvider<int?>((ref) => 0);
final previousMovieIndex = StateProvider<int?>((ref) => -1);
final onNotify = StateProvider<bool>((ref) => false);
final navIndex = StateProvider<int>((ref) => 0);
final movieDescriptionProvider = StateProvider<int>((ref) => 0);
final onPressed = StateProvider<bool>((ref) => false);
final heroTagProvider = StateProvider<dynamic>((ref) => '');
// final isChanged = StateProvider<bool>((ref) => true);
