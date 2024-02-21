import 'package:movie_sample/core/shared/presentation/view%20models/moviesVm.dart';

abstract class MovieRepository {
  Future<List<MoviesVm>> getFetchedMovies();
}