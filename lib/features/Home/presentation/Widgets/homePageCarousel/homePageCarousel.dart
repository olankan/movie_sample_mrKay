import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/providers/providers.dart';
import '../../../../../core/shared/presentation/view models/moviesVm.dart';

class HomePageCarousel extends ConsumerWidget {
  const HomePageCarousel({
    required this.movies,
    super.key,
    required this.bucket,
  });

  final PageStorageBucket bucket;
  final List<MoviesVm> movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final pageChanged = ref.watch(isChanged);

    // final _previousMovieIndex = ref.watch(previousMovieIndex);
    final _currentMovieIndex = ref.watch(movieIndex);
    return GestureDetector(
      onTap: () => context.go('/description'),
      child: SizedBox(
        height: 590.h,
        width: 390.w,
        child: Hero(
          tag: 'movie image',
          child: PageStorage(
            bucket: bucket,
            child: CarouselSlider.builder(
              itemCount: movies.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return CachedNetworkImage(
                  imageUrl: '$imageURL${movies[itemIndex].poster}',
                  imageBuilder: (context, image) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.r),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 590.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(90.r),
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: const Center(
                          child: CupertinoActivityIndicator(color: Colors.red)),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 590.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(90.r),
                    ),
                  ),
                );
              },
              options: CarouselOptions(

                pageViewKey: const PageStorageKey('home'),
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,

                viewportFraction: 1,
                aspectRatio: 0.1,

                onPageChanged: (index, reason) {
                  ref.watch(movieIndex.notifier).state = index;
                  ref.watch(previousMovieIndex.notifier).state =
                  _currentMovieIndex;

                  // ref.watch(isChanged.notifier).state = !pageChanged;
                  // print(pageChanged);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
