import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/viewModels/movieVm.dart';
import '../../../core/res/constants.dart';

class MovieListView extends StatelessWidget {
  final List<MovieVm> movies;
  bool isLoading;
  MovieListView({Key? key, required this.movies, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 275.h,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {

//todo 1. keep track of the current image at the center

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CachedNetworkImage(
                  imageUrl: '$imageURL${movies[index].poster}',
                  imageBuilder: (context, image) => Container(
                    height: 275.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 275.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: const Center(
                          child: CupertinoActivityIndicator(color: Colors.red)),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 240.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
