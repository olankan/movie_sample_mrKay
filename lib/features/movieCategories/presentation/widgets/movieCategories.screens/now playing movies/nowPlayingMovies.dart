// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import '../movie category exports/movieCategories.export.dart';

class NowPlayingMovies extends ConsumerWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        nowPlayingMovies.when(
          data: (movies) {
            // movies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // key: Key(selectedGenreType),
                  padding: const EdgeInsets.only(left: 2.0, bottom: 2).r,
                  child: const MovieTypeText(movieType: 'Now Playing Movies')
                ),
                MovieListViewBuilder(
                  navigateToWhere: 'nowPlayingMovies',
                  movies: movies,
                )
              ],
            );
          },
          loading: () {
            return Center(
              child: SizedBox(
                height: 175.0.h,
                child: Transform.scale(
                  scale: 1.3,
                  child: const CupertinoActivityIndicator(color: Colors.red),
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: SizedBox(
                height: 175.0.h,
                child: SingleChildScrollView(child: Text(' $stackTrace')),
              ),
            );
          },
        )
      ],
    );
  }
}
