// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

import '../movie category exports/movieCategories.export.dart';

class PopularMovies extends ConsumerWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(popularMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        popularMovies.when(
          data: (movies) {
            // movies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // key: Key(selectedGenreType),
                  padding: const EdgeInsets.only(left: 2.0, bottom: 2).r,
                  child: const MovieTypeText(movieType: 'Popular Movies')
                ),
                MovieListViewBuilder(
                  navigateToWhere: 'popularMovies',
                  movies: movies,
                )
              ],
            );
          },
          loading: () {
            return Center(
              child: SizedBox(
                height: 170.0.h,
                child: Transform.scale(
                  scale: 1.3,
                  child: const Center(
                      child: CupertinoActivityIndicator(color: Colors.red)),
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: SizedBox(
                height: 170.0.h,
                child: SingleChildScrollView(child: Text(' $stackTrace')),
              ),
            );
          },
        )
      ],
    );
  }
}
