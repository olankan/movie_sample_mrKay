import '../../../domain/models/movie credits model/movieCredits.model.dart';

class MovieCreditsVm {
  final Cast? actor;
  MovieCreditsVm({this.actor});

  String get name {
    return actor!.name!;
  }

  String get poster {
    return actor!.profilePath!;
  }

  String get character {
    return actor!.character!;
  }
}
