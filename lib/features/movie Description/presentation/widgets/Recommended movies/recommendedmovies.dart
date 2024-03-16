// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/core/shared/presentation/providers/sharedProviders.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/movieCategoriesProvider.dart';

import '../../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';

class RecommendedMovies extends ConsumerWidget {
  const RecommendedMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendedMovies = ref.watch(movieRecommendationsProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        recommendedMovies.when(
          data: (movies) {
            // movies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // key: Key(selectedGenreType),
                  padding: const EdgeInsets.only(left: 2.0, bottom: 10).r,
                  child: Text(
                    'Recommended Movies',
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
                          'No Recommendation yet.',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                      )
                    : SizedBox(
                        height: 220.0.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              final selectedMovie = movies[index];

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // ref.watch(movieID.notifier).state =
                                      //     selectedMovie.movieID;
                                      // ref.watch(onNavigateTo.notifier).state =
                                      //     'recommendedMovies';
                                      // ref.watch(movieIndex.notifier).state = index;
                                      // context.go('/description');
                                    },
                                    child: selectedMovie.poster == null
                                    ? Column(
                                        children: [
                                          Container(
                                                     height: 180.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.black.withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                                child: Center(
                                                    child: Icon(
                                                        Icons
                                                            .image_not_supported_outlined,
                                                        color: Colors.white.withOpacity(0.3),
                                                        size: 50)),
                                              ).animate().fadeIn(
                                              begin: 0.5,
                                              duration: 1000.ms,
                                              curve: Curves.easeInOutCubic),
                                          SizedBox(
                                              key: Key(selectedMovie.title),
                                              height: 20.h,
                                              width: 118.w,
                                              child: selectedMovie.title.length > 16
                                                  ? Center(
                                                      child: Marquee(
                                                        text: selectedMovie.title,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              fontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14.sp,
                                                          // fontWeight: FontWeight.w900,
                                                          color: Colors.white,
                                                        ),
                                                        blankSpace: 20.0,
                                                        accelerationDuration:
                                                            200.ms,
                                                        pauseAfterRound: 200.ms,
                                                      ).animate().fadeIn(
                                                          begin: 0.5,
                                                          duration: 500.ms,
                                                          curve:
                                                              Curves.easeInOut),
                                                    )
                                                  : //
                                                  Center(
                                                      child: Text(
                                                        selectedMovie.title,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontFamily:
                                                              fontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ).animate().fadeIn(
                                                          begin: 0.5,
                                                          duration: 500.ms,
                                                          curve:
                                                              Curves.easeInOut),
                                                    )),
                                          SizedBox(
                                            height: 5.h,
                                          )
                                        ],
                                      ) : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              '$imageURL${selectedMovie.poster}',
                                          imageBuilder: (context, image) =>
                                              Container(
                                            height: 180.h,
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
                                          placeholder: (context, url) =>
                                              Container(
                                            height: 180.h,
                                            width: 130.w,
                                            decoration: BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                            ),
                                            child: Transform.scale(
                                              scale: 1.3,
                                              child: Center(
                                                  child:
                                                      CupertinoActivityIndicator(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.8))),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            height: 180.h,
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
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 18.r)
                                                .animate()
                                                .fadeIn(
                                                    begin: 0.5,
                                                    duration: 1000.ms,
                                                    curve:
                                                        Curves.easeInOutCubic),
                                            Text(
                                              '${selectedMovie.rating.roundToDouble()}/10',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: fontFamily,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            key: Key(selectedMovie.title),
                                            height: 18.h,
                                            width: 118.w,
                                            child: selectedMovie.title.length >
                                                    16
                                                ? Marquee(
                                                    text: selectedMovie.title,
                                                    style: TextStyle(
                                                      fontFamily: fontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.sp,
                                                      // fontWeight: FontWeight.w900,
                                                      color: Colors.white
                                                          ,
                                                    ),
                                                    blankSpace: 20.0,
                                                    accelerationDuration:
                                                        200.ms,
                                                    pauseAfterRound: 200.ms,
                                                  ).animate().fadeIn(
                                                    begin: 0.5,
                                                    duration: 500.ms,
                                                    curve: Curves.easeInOut)
                                                : //
                                                Text(
                                                    selectedMovie.title,
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontFamily: fontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white
                                                          ,
                                                    ),
                                                  ).animate().fadeIn(
                                                    begin: 0.5,
                                                    duration: 500.ms,
                                                    curve: Curves.easeInOut)),
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
