import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_sample/core/shared/data/Api/movies/movieApiService.dart';
import 'package:movie_sample/features/movieCategories/data/models/movieByGenremodel/movieByGenreModel.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/MovieInfoHeader/movieInfoHeader.dart';
import 'package:movie_sample/features/movieCategories/presentation/view%20models/moviesByGenreVm/movieByGenreVm.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/moviesVm.dart';

import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/data/Api/moviesByGenre/moviesByGenreApiService.dart';
import '../../../../../core/shared/data/repository/genreRepoImpl/genre_Repository_impl.dart';
import '../../../../../core/shared/presentation/providers/providers.dart';
import '../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';

class GlassmorphicBackground extends ConsumerWidget {
  const GlassmorphicBackground(
      {super.key, required this.currentMovieIndex, required this.movies});

  final int? currentMovieIndex;
  final movies;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MoviesByGenreVm> genreMovies;
    final selectedMovie = movies[currentMovieIndex];
    final isNotified = ref.watch(onNotify);
    //  final selectedMovie =
    //         movies.isNotEmpty ? movies[_currentMovieIndex!] : null;
    //     final movies = ref.watch(movieProvider);
    //   final currentMovieIndex = ref.watch(movieIndex);
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
                imageUrl: '$imageURL${movies[currentMovieIndex!].poster}',
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
                  selectedMovie: selectedMovie, isNotified: isNotified)),
          // Text()
          
          // CarouselSlider.builder(itemCount: genreMovies.length, itemBuilder: itemBuilder, options: options)
        ],
      ),
    );
  }
}
