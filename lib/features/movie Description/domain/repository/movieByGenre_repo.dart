import '../../../../core/shared/presentation/view models/movieByGenre.dart';
import '../../../../core/shared/presentation/view models/moviesVm.dart';

abstract class MovieByGenreRepo {
  Future<List<MoviesByGenreVm>> getFetchedMoviesByGenre();
}