// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/movieByGenreRepoImpl/movieByGenre_ repository_impl.dart';
import '../view models/moviesByGenreVm/movieByGenreVm.dart';

final movieByGenreProvider = FutureProvider<List<MoviesByGenreVm>>((ref) async {
  // Access the value of movieGenreID using ref.watch
  int genreId = ref.watch(movieGenreID);
  print(genreId);

  try {
    MovieByGenreRepoImpl movieByGenreRepoImpl = MovieByGenreRepoImpl();
    return await movieByGenreRepoImpl.getFetchedMoviesByGenre(genreId);
  } catch (e) {
    print(e);
    return [];
  }
});

final movieGenreID = StateProvider<int>((ref) => 16);
final movieGenreType = StateProvider<String>((ref) => 'Action');
final movieByGenreIndex = StateProvider((ref) => 0);
final selectedGenreIndex = StateProvider((ref) => 0);
