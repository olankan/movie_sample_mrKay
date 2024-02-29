import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/core/shared/presentation/providers/sharedProviders.dart';

import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

// final descriptionProvider = StateProvider((ref) => movieProvider);

class MovieDescriptionProvider extends StateNotifier {
  MovieDescriptionProvider(super.state);

  setObject(val) {
    state = val;
  }
}

class MoviesByGenreDescriptionProvider extends StateNotifier {
  MoviesByGenreDescriptionProvider(super._state);

  setObject(val) {
    state = val;
  }
}

final descriptionProvider =
    StateNotifierProvider((ref) => MovieDescriptionProvider(dynamic));
final isMovieByGenreScreen = StateProvider<bool>((ref) => false);

