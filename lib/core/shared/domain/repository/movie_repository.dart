import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';

abstract class MovieRepository {
  Future<List<MoviesVm>> getFetchedMovies();
    // Future<List<MoviesVm>> getFetchedMoviesByGenre();
}