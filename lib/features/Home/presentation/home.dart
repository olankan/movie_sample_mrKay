// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/core/resources/constants.dart';
import 'package:movie_sample/core/shared/data/repository/genre_Repository_impl.dart';
import 'package:movie_sample/core/shared/presentation/providers/providers.dart';
import '../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';
import '../../../../core/shared/presentation/view models/moviesVm.dart';
import '../../../../core/shared/presentation/reuasable widgets/MovieInfoHeader/movieInfoHeader.dart';

import 'Widgets/bottomNavBar/bottomNavBar.dart';
import 'Widgets/homePageCarousel/homePageCarousel.dart';
import 'Widgets/watchTrailer/watchTrailer.dart';

class HomeNew extends ConsumerWidget {
  const HomeNew({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _movies = ref.watch(movieProvider);
    final _currentMovieIndex = ref.watch(movieIndex);
    final selectedNavIndex = ref.watch(navIndex);
    final isNotified = ref.watch(onNotify);

    final PageStorageBucket bucket = PageStorageBucket();
    return _movies.when(
      data: (movies) {
        final selectedMovie =
            movies.isNotEmpty ? movies[_currentMovieIndex!] : null;

        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Container(color: Colors.white,),
              CachedNetworkImage(
                key: Key('$imageURL${movies[_currentMovieIndex!].poster}'),
                cacheKey: '$imageURL${movies[_currentMovieIndex!].poster}',
                imageUrl: '$imageURL${movies[_currentMovieIndex!].poster}',
                imageBuilder: (context, image) => Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(90.r),
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms, begin: 0.5),
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    // borderRadius: BorderRadius.circular(90.r),
                  ),
                  child: Transform.scale(
                    scale: 1.3,
                    child: const Center(
                        child: CupertinoActivityIndicator(color: Colors.red)),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  // height: 240.h,
                  // width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(22.r),
                  ),
                ),
              ),
              GlassmorphicContainer(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                borderRadius: 0,
                border: 0,
                blur: 20,
                linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.05),
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
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Hero(
                      tag: 'header',
                      child: MovieInfoHeader(
                          selectedMovie: selectedMovie, isNotified: isNotified),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    HomePageCarousel(
                      bucket: bucket,
                      movies: movies,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BottomNavBar(selectedNavIndex: selectedNavIndex),
                  ],
                ),
              ),
              Positioned(
                  left: 292.w,
                  top: 95.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0).r,
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 25.r,
                              color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(width: 15.w),
                            GestureDetector(
                              onTap: () {
                                ref.watch(onNotify.notifier).state =
                                    !isNotified;
                              },
                              child: Icon(
                                isNotified
                                    ? EvaIcons.bell
                                    : EvaIcons.bellOutline,
                                color: Colors.white.withOpacity(0.8),
                                size: 25.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      WatchTrailer(currentMovieIndex: _currentMovieIndex),
                    ],
                  )),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => Center(
        child: Transform.scale(
          scale: 1.3,
          child: CupertinoActivityIndicator(color: Colors.red),
        ),
      ),
    );
  }
}