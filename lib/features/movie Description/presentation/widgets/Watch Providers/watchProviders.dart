// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/resources/constants.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';

class WatchProviders extends ConsumerWidget {
  const WatchProviders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProvider = ref.watch(movieWatchProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Watch Providers',
          style: TextStyle(
              color: Colors.white,
              fontFamily: fontFamily,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.h,
        ),
        watchProvider.when(
          data: (watchProviders) {
            return watchProviders.isEmpty || watchProviders == null ? CustomContainer(
                            height: 50.h,
                            width: double.infinity,
                            radius: 22.r,
                            backgroundColor: Colors.black.withOpacity(0.2),
                            child: Center(
                                child: Text(
                              'No Watch Provider yet.',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ) :  SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: watchProviders.length,
                  itemBuilder: (BuildContext context, int index) {
                    final watchProvider = watchProviders[index];
                    print(watchProviders.length);
                    return Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: '$imageURL${watchProvider.backDropPaths}',
                          imageBuilder: (context, image) => Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14).r,
                              image: DecorationImage(
                                image: image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14).r,
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
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14).r,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                      ],
                    );
                  }),
            );
          },
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => Center(
            child: Transform.scale(
              scale: 1.3,
              child: CupertinoActivityIndicator(
                  color: Colors.white.withOpacity(0.8)),
            ),
          ),
        ),
      ],
    );
  }
}
