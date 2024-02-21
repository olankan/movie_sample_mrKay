import 'package:movie_sample/features/Home/domain/repository/movie_repository.dart';
import '../../../../core/shared/data/Api/movies/fetchMovieService.dart';
import '../../../../core/shared/presentation/view models/moviesVm.dart';

class MovieRepositoryImpl extends MovieRepository {
  final _fetchMovieService = FetchMoviesService();
  @override
  Future<List<MoviesVm>> getFetchedMovies() async {
    var res = await _fetchMovieService.getFetchedMoviesList();
    return res!.results!.map((e) => MoviesVm(movie: e)).toList();
  }

  
  

}

// CAN ALSO BE DONE LIKE THIS
// class MovieRepositoryImpl extends MovieRepository {
//   final FetchMoviesService _fetchMovieService;
//   MovieRepositoryImpl(this._fetchMovieService);
//   @override
//   Future<List<MovieVm>> getFetchedMovies() async {
//     var res = await _fetchMovieService.getFetchedMoviesList();
//     return res!.results!.map((e) => MovieVm(movie: e)).toList();
//   }
// }