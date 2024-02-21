import '../../domain/model/movieByGenreModel.dart';

class MoviesByGenreVm {
  final Result? movie;
  MoviesByGenreVm({this.movie});

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


int get voteCount {
    return movie!.voteCount!;
  }
}
