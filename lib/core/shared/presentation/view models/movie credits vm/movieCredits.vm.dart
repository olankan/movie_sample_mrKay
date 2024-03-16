import '../../../domain/models/movie credits model/movieCredits.model.dart';

class MovieCreditsVm {
  final Cast? cast;
  final Crew? crew;

  MovieCreditsVm({this.cast, this.crew});
  String? get castName => cast?.name ?? '';

  String? get castPoster => cast?.profilePath ?? '';

  String? get castCharacter {
    return cast?.character ?? '';
  }

  String? get crewName => crew?.name;

  String? get crewPoster => crew?.profilePath ;

  String? get crewJob => crew?.job;
}
