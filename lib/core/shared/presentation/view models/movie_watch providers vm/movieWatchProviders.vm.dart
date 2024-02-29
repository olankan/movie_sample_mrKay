import "package:movie_sample/core/shared/domain/models/movie_watch providers model/movieWatchProviders.model.dart";

class MovieWatchProvidersVm {
  final Buy? watchProviders;
  MovieWatchProvidersVm({this.watchProviders});

  String get backDropPaths {
    return watchProviders!.logoPath!;
  }
}
