// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/moviesByGenreProvider.dart';
import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/providers/providers.dart';
import '../../widgets/arrowBackButton/arrowBackButton.dart';
import '../../widgets/glassmorphicBackground/glassmorphicBackground.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      // final movieDescriptionIndex = ref.watch(movieDescriptionProvider);
      final movies = ref.watch(movieProvider);
      // movieDescriptionIndex == 0
      // ? ref.watch(movieProvider)
      // : ref.watch(movieByGenreProvider);

      final currentMovieIndex = ref.watch(movieIndex);

      // final selectedNavIndex = ref.watch(navIndex);

      return movies.when(
        data: (movies) {
          // final selectedMovie =
          //     movies.isNotEmpty ? movies[currentMovieIndex!] : null;
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
                  GlassmorphicBackground(
                      currentMovieIndex: currentMovieIndex, movies: movies),
                  ArrowBackButton(),
                ],
              ));
        },
        error: (Object error, StackTrace stackTrace) => Container(),
        loading: () => Container(),
      );
    });
  }
}
