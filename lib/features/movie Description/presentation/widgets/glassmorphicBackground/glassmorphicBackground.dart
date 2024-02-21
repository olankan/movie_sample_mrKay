import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_sample/core/shared/data/Api/movies/movieApiService.dart';
import 'package:movie_sample/core/shared/domain/model/movieByGenreModel.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/MovieInfoHeader/movieInfoHeader.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movieByGenre.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/moviesVm.dart';

import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/data/Api/moviesByGenre/moviesByGenre.dart';
import '../../../../../core/shared/data/repository/genre_Repository_impl.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
            child: SizedBox(
              height: 20.0.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: GenreInfo().genresData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final genre = GenreInfo().genresData[index];
                    // final movieLoader =
                    //     MoviesByGenreApiService().getMoviesByGenre(genre['id']);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4).r,
                          height: 20.h,
                          width: null,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10).r,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                              )),
                          child: Center(
                            child: Text(
                              genre['name'],
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: fontFamily,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ).animate().fadeIn(
                            begin: 0.5,
                            duration: 1000.ms,
                            curve: Curves.easeInOutCubic),
                        Visibility(
                          visible: index != GenreInfo().genresData.length - 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0).r,
                            child: CustomContainer(
                              backgroundColor: Colors.white.withOpacity(0.8),
                              height: 2.h,
                              width: 2.w,
                            ).animate().fadeIn(
                                begin: 0.5,
                                duration: 1000.ms,
                                curve: Curves.easeInOutCubic),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          // CarouselSlider.builder(itemCount: genreMovies.length, itemBuilder: itemBuilder, options: options)
        ],
      ),
    );
  }
}
