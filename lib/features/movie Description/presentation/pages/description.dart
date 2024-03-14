// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/MovieInfoHeader/movieInfoHeader.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Cast%20character/castCharacter.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Crew%20character/crewCharacter.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Recommended%20movies/recommendedmovies.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Watch%20Providers/watchProviders.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/movie%20review%20card/movieReviewCard.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/similar%20movies/similarMovies.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/shared/presentation/providers/sharedProviders.dart';
import '../../../movieCategories/presentation/providers/movieCategoriesProvider.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final movieCastCredit = ref.watch(movieCastCreditsProvider);
      final movieCrewCredit = ref.watch(movieCrewCreditsProvider);
      final movieIdAsHeroTag = ref.watch(movieID);
      // final isNavigatedToMBG = ref.watch(onNavigateToMoviesByGenre);
      final movies = ref.watch(movieCategoryProvider);
      final currentMovieIndex = ref.watch(movieIndex);
      // final currentScreen = ref.watch(onNavigateTo);
      final movieVmAsHeroTag = ref.watch(heroTagProvider);
      // final selectedNavIndex = ref.watch(navIndex);

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
                  GlassmorphicContainer(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    borderRadius: 0,
                    border: 0,
                    blur: 15,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.1),
                      ],
                      stops: [0.1, 1],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0),
                        Color((0xFFFFFFFF)).withOpacity(0),
                      ],
                    ),
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
                                  Text(
                                    'Cast',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  movieCastCredit.when(
                                    data: (credits) {
                                      return SizedBox(
                                        height: 172.h,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: credits.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final credit = credits[index];
                                              return Row(
                                                children: [
                                                  credit.castPoster == '' ||
                                                          credit.castPoster ==
                                                              null
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0)
                                                                  .r,
                                                          child: Column(
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.black
                                                                        .withOpacity(
                                                                            0.5),
                                                                radius: 30.r,
                                                                child: Icon(
                                                                  Icons
                                                                      .person_off_rounded,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.7),
                                                                  size: 35.r,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 120.w,
                                                                child: Text(
                                                                  credit
                                                                      .castName
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        fontFamily,
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              CastCharacter(
                                                                  credit:
                                                                      credit)
                                                            ],
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0)
                                                                  .r,
                                                          child: Column(
                                                            children: [
                                                              CachedNetworkImage(
                                                                imageUrl:
                                                                    '$imageURL${credit.castPoster}',
                                                                imageBuilder: (context, image) => CircleAvatar(
                                                                    backgroundColor: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    radius:
                                                                        30.r,
                                                                    backgroundImage:
                                                                        image),
                                                                placeholder: (context,
                                                                        url) =>
                                                                    CircleAvatar(
                                                                  backgroundColor: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  radius: 30.r,
                                                                  child:
                                                                      Transform
                                                                          .scale(
                                                                    scale: 1.3,
                                                                    child: Center(
                                                                        child: CupertinoActivityIndicator(
                                                                            color:
                                                                                Colors.white.withOpacity(0.8))),
                                                                  ),
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    CircleAvatar(
                                                                  backgroundColor: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  radius: 30.r,
                                                                  child: Text(
                                                                      'Error: $error'),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 120.w,
                                                                child: Text(
                                                                  credit
                                                                      .castName
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        fontFamily,
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              CastCharacter(
                                                                  credit:
                                                                      credit)
                                                            ],
                                                          ),
                                                        ),
                                                ],
                                              );
                                            }),
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        Text('Error: $error'),
                                    loading: () => Center(
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: SizedBox(
                                          height: 160.h,
                                          child: CupertinoActivityIndicator(
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 20.h),
                                  Text(
                                    'Crew',
                                    style: TextStyle(
                                      fontFamily: fontFamily,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  movieCrewCredit.when(
                                    data: (credits) {
                                      return Container(
                                        color: Colors.transparent,
                                        height: 170.h,
                                        width: double.infinity,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: credits.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final credit = credits[index];
                                              return Row(
                                                children: [
                                                  credit.crewPoster == null
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0)
                                                                  .r,
                                                          child: Column(
                                                            // mainAxisSize:
                                                            //     MainAxisSize
                                                            //         .min,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.black
                                                                        .withOpacity(
                                                                            0.5),
                                                                radius: 30.r,
                                                                child: Icon(
                                                                  Icons
                                                                      .person_off_rounded,
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.7),
                                                                  size: 35.r,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 120.w,
                                                                child: Text(
                                                                  credit
                                                                      .crewName
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        fontFamily,
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              CrewCharacter(
                                                                  credit:
                                                                      credit)
                                                            ],
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0)
                                                                  .r,
                                                          child: Column(
                                                            // mainAxisSize:
                                                            //     MainAxisSize
                                                            //         .min,
                                                            children: [
                                                              CachedNetworkImage(
                                                                imageUrl:
                                                                    '$imageURL${credit.crewPoster}',
                                                                imageBuilder: (context, image) => CircleAvatar(
                                                                    backgroundColor: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    radius:
                                                                        30.r,
                                                                    backgroundImage:
                                                                        image),
                                                                placeholder: (context,
                                                                        url) =>
                                                                    CircleAvatar(
                                                                  backgroundColor: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  radius: 30.r,
                                                                  child:
                                                                      Transform
                                                                          .scale(
                                                                    scale: 1.3,
                                                                    child: Center(
                                                                        child: CupertinoActivityIndicator(
                                                                            color:
                                                                                Colors.white.withOpacity(0.8))),
                                                                  ),
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    CircleAvatar(
                                                                  backgroundColor: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  radius: 30.r,
                                                                  child: Text(
                                                                      'Error: $error'),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 120.w,
                                                                child: Text(
                                                                  credit
                                                                      .crewName
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        fontFamily,
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                              CrewCharacter(
                                                                  credit:
                                                                      credit),
                                                            ],
                                                          ),
                                                        ),
                                                ],
                                              );
                                            }),
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        Text('Error: $error'),
                                    loading: () => Center(
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: SizedBox(
                                          height: 160.h,
                                          child: CupertinoActivityIndicator(
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                      ),
                                    ),
                                  ),
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
                      // ref.watch(movieIndex.notifier).state = 0;
                      context.pop();

                      // ref.watch(onNavigateToMoviesByGenre.notifier).state =
                      //     !isNavigatedToMBG;
                      // print('Tapped');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20.0).r,
                      child: GlassmorphicContainer(
                        width: 50.w,
                        height: 50.h,
                        borderRadius: 16.r,
                        border: 0,
                        blur: 15,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.1),
                          ],
                          stops: [0.1, 1],
                        ),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0),
                            Color((0xFFFFFFFF)).withOpacity(0),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.r,
                            color: Colors.white,
                          ),
                        ),
                      ).animate().slide(
                            duration: 500.ms,
                            delay: 200.ms,
                          ),
                    ),
                  ),
                ],
              ));
        },
        error: (Object error, StackTrace stackTrace) => Container(),
        loading: () => Container(),
      );
    });
  }
}
