import 'package:movie_sample/features/Home/data/models/movieModel.dart';

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

List<int>? get genreId {
  return movie!.genreIds;
}

  String get poster {
    return movie!.posterPath!;
  }

 String get backdropPath{
    return movie!.backdropPath!;
  }

   String get overview {
    return movie!.overview!;
  }

   double get rating {
    return movie!.voteAverage!;
  }

    int get movieID {
    return movie!.id!;
  }

   double get popularity {
    return movie!.popularity!;
  }

  DateTime get year {
    return movie!.releaseDate!;
  }

  String get id {
    return '${movie!.id}';         
  }
}
