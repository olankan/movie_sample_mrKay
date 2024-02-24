// ignore_for_file: camel_case_types

import '../../../../../core/shared/data/Api/moviesByGenre/fetchMovieByGenreService.dart';
import '../../../presentation/view models/moviesByGenreVm/movieByGenreVm.dart';
import '../../../domain/repository/movieByGenreRepo/movieByGenre_repo.dart';

class MovieByGenreRepoImpl implements MovieByGenreRepo {
  final _fetchMoviesByGenreService = FetchMoviesByGenreService();
  @override
  Future<List<MoviesByGenreVm>> getFetchedMoviesByGenre(id) async {
    var res = await _fetchMoviesByGenreService.getFetchedMoviesByGenreList(id);
    // print(id);
    return res!.results!.map((e) => MoviesByGenreVm(movie: e)).toList();
  }
}
