import 'package:flutter/cupertino.dart';

import '../movie category exports/movieCategories.export.dart';

class AiringTodayMovies extends ConsumerWidget {
  const AiringTodayMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airingTodayMovies = ref.watch(airingTodayProvider);

    // final currentScreen = ref.read(onNavigateTo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        airingTodayMovies.when(
          data: (movies) {
            // movies.shuffle();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // key: Key(selectedGenreType),
                  padding: const EdgeInsets.only(left: 2.0, bottom: 2).r,
                  child:MovieTypeText(movieType: 'Airing Today Shows')
                ),
                MovieListViewBuilder(
                  movies: movies,
                  navigateToWhere: 'airingTodayMovies',
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
