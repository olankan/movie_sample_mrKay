import '../on_the_air model/onTheAirMovies.model.dart';

class OnTheAirMoviesVm {
  final Result? movie;
  OnTheAirMoviesVm({this.movie});

  String get title {
    return movie!.name!;
  }

  DateTime get releaseDate {
    return movie!.firstAirDate!;
  }

  List<int> get genreId {
    return movie!.genreIds!;
  }

  String get poster {
    return movie!.posterPath!;
  }

  String get backdropPath {
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

  List<String> get year {
    return movie!.originCountry!;
  }

  int get voteCount {
    return movie!.voteCount!;
  }
}
