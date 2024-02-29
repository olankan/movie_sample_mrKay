// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/MovieInfoHeader/movieInfoHeader.dart';

import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/providers/sharedProviders.dart';
import '../../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

class GlassmorphicBackground extends ConsumerWidget {
  const GlassmorphicBackground({super.key, required this.movies});

  final MoviesVm movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotified = ref.watch(onNotify);

    return GlassmorphicContainer(
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
      child: Column(
        children: [
          SizedBox(
            height: 450.h,
            child: Hero(
              tag: 'movie image',
              child: CachedNetworkImage(
                imageUrl: '$imageURL${movies.poster}',
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
                        child: CupertinoActivityIndicator(color: Colors.red)),
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
          SizedBox(
            height: 10.h,
          ),
          Hero(
              tag: 'header',
              child: MovieInfoHeader(
                  selectedMovie: movies, isNotified: isNotified)),
          // Text()

          // CarouselSlider.builder(itemCount: genreMovies.length, itemBuilder: itemBuilder, options: options)
        ],
      ),
    );
  }
}
