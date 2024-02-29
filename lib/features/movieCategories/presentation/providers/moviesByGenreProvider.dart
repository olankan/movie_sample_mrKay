// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

final movieByGenreProvider = FutureProvider<List<MoviesVm>>((ref) async {
  int genreId = ref.watch(movieGenreID);
  try {
    FetchedMoviesListService _fetchedMoviesListService =
        FetchedMoviesListService();
    return await _fetchedMoviesListService.getFetchedMoviesByGenreList(genreId);
  } catch (e) {
    print(e);
    return [];
  }
});

final movieGenreID = StateProvider<int>((ref) => 16);
final movieGenreType = StateProvider<String>((ref) => 'Action');
final movieByGenreIndex = StateProvider((ref) => 0);
final selectedGenreIndex = StateProvider((ref) => 0);
