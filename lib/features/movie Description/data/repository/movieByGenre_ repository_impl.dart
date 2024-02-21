
import '../../../../core/shared/data/Api/moviesByGenre/fetchMovieByGenreService.dart';
import '../../../../core/shared/presentation/view models/movieByGenre.dart';
import '../../../../core/shared/presentation/view models/moviesVm.dart';
import '../../domain/repository/movieByGenre_repo.dart';

class MovieByGenre_impl implements MovieByGenreRepo {
    final _fetchMoviesByGenreService = FetchMoviesByGenreService();
  @override
  Future<List<MoviesByGenreVm>> getFetchedMoviesByGenre() async {
    var res = await _fetchMoviesByGenreService.getFetchedMoviesByGenreList();
    return res!.results!.map((e) => MoviesByGenreVm(movie: e)).toList();
  }
}