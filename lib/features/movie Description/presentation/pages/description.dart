// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/glassmorphicBackground/glassmorphicBackground.dart';
import 'description.export.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final movies = ref.watch(movieCategoryProvider);
      final currentMovieIndex = ref.watch(movieIndex);
      final movieVmAsHeroTag = ref.watch(heroTagProvider);

      return movies.when(
        data: (movies) {
          final selectedMovie = movies[currentMovieIndex!];
          return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '$imageURL${selectedMovie.poster}',
                    imageBuilder: (context, image) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Center(
                            child: CupertinoActivityIndicator(
                                color: Colors.white.withOpacity(0.8))),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GlassMorphicBackground(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 450.h,
                          child: CachedNetworkImage(
                            imageUrl:
                                '$imageURL${movies[currentMovieIndex].poster}',
                            imageBuilder: (context, image) => Hero(
                              tag: movieVmAsHeroTag,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(90),
                                    bottomRight: Radius.circular(90),
                                  ),
                                  image: DecorationImage(
                                    image: image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  bottomRight: Radius.circular(90),
                                ),
                                color: Colors.black54,
                              ),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Center(
                                    child: CupertinoActivityIndicator(
                                        color: Colors.white.withOpacity(0.8))),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(90.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0).r,
                          child: SizedBox(
                            height: 450.h,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MovieInfoHeader(
                                    selectedMovie: selectedMovie,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    'About the movie',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    selectedMovie.overview,
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
//nsfknskfnksfnkskfskfsfknskfnskfnksfn
                                  // SizedBox(height: 20.h),

                                  //kgxjgxgxjjgxhxxhyjcttutxuxgxghxjggj???????? > ?
                                  Divider(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  MovieReviewCard(),
                                  SizedBox(
                                    height: 15.h,
                                  ),

                                  WatchProviders(),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  RecommendedMovies(),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SimilarMovies()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();

                      // ref.watch(onNavigateToMoviesByGenre.notifier).state =
                      //     !isNavigatedToMBG;
                      // print('Tapped');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20.0).r,
                      child: GlassMorphicBackground(
                        height: 50.h,
                        width: 50.w,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.r,
                            color: Colors.white,
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: 100.ms,
                            delay: 0.ms,
                          )
                          .slide(
                            duration: 200.ms,
                            delay: 100.ms,
                          ),
                    ),
                  ),
                  Positioned(
                    top: 190.h,
                    left: 180.w,
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierColor: Colors.transparent,
                            useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 450.h,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(90).r,
                                          bottomRight: Radius.circular(90).r,
                                        )),
                                  ),
                                  YoutubeTrailerPlayer(),
                                ],
                              );
                            },
                          );
                          // context.go('/youtube');
                        },
                        child: CustomContainer(
                                key: GlobalKey(),
                                width: 80.w,
                                height: 50.h,
                                backgroundColor: Colors.red,
                                child: Center(
                                    child: Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                  color: Colors.white,
                                ))).animate().fadeIn(
                              duration: 200.ms,
                              delay: 0.ms,
                            )),
                  )
                ],
              ));
        },
        error: (Object error, StackTrace stackTrace) => Container(),
        loading: () => Container(),
      );
    });
  }
}
