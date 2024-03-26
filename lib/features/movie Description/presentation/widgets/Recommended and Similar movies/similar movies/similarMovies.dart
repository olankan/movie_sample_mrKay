// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Recommended%20and%20Similar%20movies/DescriptionMovies_ListViewBuilder/DescriptionMovies_ListViewBuilder.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';

import '../../../../../../../core/resources/constants.dart';
import '../../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';

class SimilarMovies extends ConsumerWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMovies = ref.watch(similarMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        similarMovies.when(
          data: (movies) {
            // movies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // key: Key(selectedGenreType),
                  padding: const EdgeInsets.only(left: 2.0, bottom: 10).r,
                  child: Text(
                    'You Also  Might Like',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,
                        fontSize: 16.sp),
                  ).animate().fadeIn(
                      begin: 0.5, duration: 200.ms, curve: Curves.easeInOut),
                ),
                movies.isEmpty
                    ? CustomContainer(
                        height: 220.h,
                        width: 300.w,
                        radius: 22.r,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        child: Center(
                            child: Text(
                          'No Similar movie yet.',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      )
                    : DescriptionMoviesListViewBuilder(movies: movies,)
              ],
            );
          },
          loading: () {
            return Center(
              child: SizedBox(
                height: 170.0.h,
                child: Transform.scale(
                  scale: 1.3,
                  child: Center(
                      child: CupertinoActivityIndicator(
                          color: Colors.white.withOpacity(0.8))),
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
