import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/features/movie%20Description/presentation/providers/movieDescriptionProviders.dart';

import '../../../../../core/resources/constants.dart';
import '../../providers/moviesByGenreProvider.dart';

class MoviesByGenre extends ConsumerWidget {
  const MoviesByGenre({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesByGenre = ref.watch(movieByGenreProvider);
    final selectedGenreType = ref.watch(movieGenreType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          key: Key(selectedGenreType),
          padding: const EdgeInsets.only(left: 2.0).r,
          child: RichText(
                  text: TextSpan(children: [
            TextSpan(
                text: selectedGenreType,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                    fontSize: 20.sp)),
            TextSpan(
                text: ' movies',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                    fontSize: 20.sp))
          ]))
              .animate()
              .fadeIn(begin: 0.5, duration: 200.ms, curve: Curves.easeInOut),
        ),
        moviesByGenre.when(
          data: (genreMovies) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 215.0.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: genreMovies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = genreMovies[index];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // ref.watch(isMovieByGenreScreen.notifier).state = true;
                                // ref.watch(descriptionProvider.notifier).state = MoviesByGenreDescriptionProvider(dynamic);
                                // ref
                                //     .watch(descriptionProvider.notifier)
                                //     .setObject(movie);
                                context.go('/description');
                              },
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: '$imageURL${movie.poster}',
                                    imageBuilder: (context, image) => Container(
                                      height: 150.h,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        image: DecorationImage(
                                          image: image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(
                                      height: 150.h,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: const Center(
                                            child: CupertinoActivityIndicator(
                                                color: Colors.red)),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      height: 150.h,
                                      width: 130.w,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                    ),
                                  ).animate().fadeIn(
                                      begin: 0.5,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOutCubic),
                                  SizedBox(
                                      key: Key(movie.title),
                                      height: 18.h,
                                      width: 118.w,
                                      child: movie.title.length > 16
                                          ? Center(
                                              child: Marquee(
                                                text: movie.title,
                                                style: TextStyle(
                                                  fontFamily: fontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  // fontWeight: FontWeight.w900,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                                blankSpace: 20.0,
                                                accelerationDuration: 200.ms,
                                                pauseAfterRound: 200.ms,
                                              ).animate().fadeIn(
                                                  begin: 0.5,
                                                  duration: 500.ms,
                                                  curve: Curves.easeInOut),
                                            )
                                          : //
                                          Center(
                                              child: Text(
                                                movie.title,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: fontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                              ).animate().fadeIn(
                                                  begin: 0.5,
                                                  duration: 500.ms,
                                                  curve: Curves.easeInOut),
                                            )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                          ],
                        );
                      }),
                )
              ],
            );
          },
          loading: () {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 90).r,
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
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4).r,
                height: 550.h,
                width: 450.w,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15).r,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                child: SingleChildScrollView(child: Text(' $stackTrace')),
              ),
            );
          },
        )
      ],
    );
  }
}
