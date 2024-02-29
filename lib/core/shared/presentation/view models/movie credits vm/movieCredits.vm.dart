import '../../../domain/models/movie credits model/movieCredits.model.dart';

class MovieCreditsVm {
  final Cast? cast;
  MovieCreditsVm({this.cast});

  String get name {
    return cast!.name!;
  }

  String get poster {
    return cast!.profilePath!;
  }

  String get character {
    return cast!.character!;
  }
}
