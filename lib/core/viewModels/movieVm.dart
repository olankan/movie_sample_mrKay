import 'package:movie_sample/core/models/movieModel.dart';

class MovieVm {
  final Result? movie;
  MovieVm({this.movie});

  String get title {
    return movie!.title!;
  }

  // List<Rating> get ratings {
  //   return movie!.!;
  // }

  DateTime get releaseDate {
    return movie!.releaseDate!;
  }

  String get poster {
    return movie!.posterPath!;
  }

  DateTime get year {
    return movie!.releaseDate!;
  }

  String get id {
    return '${movie!.id}';         
  }
}
