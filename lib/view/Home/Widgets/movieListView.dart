import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/viewModels/movieVm.dart';
import 'package:redacted/redacted.dart';
import '../../../core/res/constants.dart';

class MovieListView extends StatelessWidget {
  List<MovieVm> movies;
  bool isLoading;
  MovieListView({required this.movies, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 240.h,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: isLoading
                  ? CachedNetworkImage(
                      imageUrl: '$imageURL${movies[index].poster}',
                      placeholder: (context, url) => Container(
                        height: 240.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        child: Text('data'),
                      ).redacted(
                        context: context,
                        redact: true,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : null),
        ),
      ),
    );
  }
}
