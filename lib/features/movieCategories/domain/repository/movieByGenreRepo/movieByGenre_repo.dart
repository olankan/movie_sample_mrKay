import '../../../presentation/view models/moviesByGenreVm/movieByGenreVm.dart';

abstract class MovieByGenreRepo {
  Future<List<MoviesByGenreVm>> getFetchedMoviesByGenre(id);
}
