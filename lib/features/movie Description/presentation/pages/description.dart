// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movie_sample/features/movie%20Description/presentation/providers/movieDescriptionProviders.dart';
import '../../../../core/resources/constants.dart';
import '../../../../core/shared/presentation/providers/sharedProviders.dart';
import '../../../movieCategories/presentation/providers/moviesByGenreProvider.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      // final isMovieByGenrePage = ref.watch(isMovieByGenreScreen);
      final movies = ref.watch(movieProvider);
      final currentMovieIndex = ref.watch(movieIndex);

      // final selectedNavIndex = ref.watch(navIndex);

      return movies.when(
        data: (movies) {
          final selectedMovie =
              movies.isNotEmpty ? movies[currentMovieIndex!] : null;

          var poster;
          return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '$imageURL${movies[currentMovieIndex!].poster}',
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
                        child: const Center(
                            child:
                                CupertinoActivityIndicator(color: Colors.red)),
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
                    blur: 20,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
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
                    child: SizedBox(
                      height: 450.h,
                      child: Hero(
                        tag: 'movie image',
                        child: CachedNetworkImage(
                          imageUrl:
                              '$imageURL${movies[currentMovieIndex!].poster}',
                          imageBuilder: (context, image) => Container(
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
                              child: const Center(
                                  child: CupertinoActivityIndicator(
                                      color: Colors.red)),
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
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.watch(movieIndex.notifier).state = 0;
                      context.go('/');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20.0).r,
                      child: GlassmorphicContainer(
                        width: 50.w,
                        height: 50.h,
                        borderRadius: 16.r,
                        border: 0,
                        blur: 20,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.1),
                            Color(0xFFFFFFFF).withOpacity(0.05),
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
                            color: Colors.black.withOpacity(0.8),
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
