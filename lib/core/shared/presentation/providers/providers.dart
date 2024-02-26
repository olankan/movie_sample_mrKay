import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/core/shared/data/repository/movieRepoImpl/movie_repository_impl.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';

final movieProvider = FutureProvider<List<MoviesVm>>((ref) async {
  MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl();
  return await movieRepositoryImpl.getFetchedMovies();
});
final movieIndex = StateProvider<int?>((ref) => 0);
final previousMovieIndex = StateProvider<int?>((ref) => -1);
final onNotify = StateProvider<bool>((ref) => false);
final navIndex = StateProvider<int>((ref) => 0);
final movieDescriptionProvider = StateProvider<int>((ref) => 0);
// final isChanged = StateProvider<bool>((ref) => true);
