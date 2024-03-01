import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import 'package:movie_sample/core/shared/presentation/providers/sharedProviders.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';

class MyFutureBuilder extends ConsumerWidget {
  MyFutureBuilder({Key? key}) : super(key: key);

  final FetchedMoviesListService _fetchedMoviesListService =
      FetchedMoviesListService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = ref.watch(onPressed);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<MoviesVm>>(
            future: isPressed == false
                ? _fetchedMoviesListService.getFetchedDiscoveredMoviesList()
                : _fetchedMoviesListService.getFetchedAiringTodayList(),
            builder: (BuildContext context, AsyncSnapshot<List<MoviesVm>> snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.hasError
                      ? Center(
                          child: Text(
                            snapshot.error.toString(),
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              ...List.generate(snapshot.data!.length,
                                  (index) => Text(snapshot.data![index].title))
                            ],
                          ),
                        );
            },
          ),
        ],
      ),
    );
  }
}
