// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/movieCategoriesProvider.dart';
import 'package:movie_sample/features/movieCategories/presentation/widgets/moviesByGenre/movieCategories.screens/nowPlayingMovies.dart';

import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/data/repository/genreRepoImpl/genre_Repository_impl.dart';
import '../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';
import '../../providers/moviesByGenreProvider.dart';
import '../../widgets/moviesByGenre/moviesByGenre.dart';

class MovieCategoriesScreen extends ConsumerWidget {
  const MovieCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenre = ref.watch(selectedGenreIndex);

    print('Entered movie cat successfully');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        height: MediaQuery.of(context).size.height / 1.1275,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 10).r,
                child: SizedBox(
                  height: 40.0.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: GenreInfo.genresData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final genre = GenreInfo.genresData[index];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ref.watch(selectedGenreIndex.notifier).state =
                                    index;
                                ref.watch(movieGenreID.notifier).state =
                                    genre['id'];
                                ref.watch(movieGenreType.notifier).state =
                                    genre['name'];
                              },
                              child: AnimatedContainer(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4).r,
                                height: 30.h,
                                width: null,
                                decoration: BoxDecoration(
                                    color: selectedGenre == index
                                        ? Colors.white.withOpacity(0.8)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(15).r,
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.8),
                                    )),
                                duration: 300.ms,
                                child: Center(
                                  child: Text(
                                    genre['name'],
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: fontFamily,
                                      fontWeight: selectedGenre == index
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: selectedGenre == index
                                          ? Colors.black
                                          : Colors.white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ).animate().fadeIn(
                                  begin: 0.5,
                                  duration: 1000.ms,
                                  curve: Curves.easeInOutCubic),
                            ),
                            Visibility(
                              visible: index != GenreInfo.genresData.length - 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0)
                                        .r,
                                child: CustomContainer(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.8),
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
              MoviesByGenre(),
              NowPlayingMovies()
            ],
          ),
        ),
      ),
    );
  }
}
