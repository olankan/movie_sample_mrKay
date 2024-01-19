// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/viewModels/movieVm.dart';
import '../../../core/res/constants.dart';

class MovieListView extends StatefulWidget {
  final List<MovieVm> movies;

  Function? onIndexChanged;

  MovieListView({Key? key, required this.movies, this.onIndexChanged})
      : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
      child: SizedBox(
        height: 275.h,
        // width: 200.w,
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.55),
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
              if (widget.onIndexChanged != null) {
                widget.onIndexChanged!(currentIndex!);
                print('Current Indexxxx: $currentIndex');
              }
            },
            itemCount: widget.movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              double scale = index == currentIndex ? 1 : 0.8;
              return TweenAnimationBuilder(
                tween: Tween(begin: scale, end: scale),
                curve: Curves.ease,
                duration: const Duration(milliseconds: 350),
                builder: (BuildContext context, Object? value, Widget? child) =>
                    Transform.scale(
                  scale: scale,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: CachedNetworkImage(
                      imageUrl: '$imageURL${widget.movies[index].poster}',
                      imageBuilder: (context, image) => Container(
                        height: 275.h,
                        width: 100.w,
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
                              child: CupertinoActivityIndicator(
                                  color: Colors.red)),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 240.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
