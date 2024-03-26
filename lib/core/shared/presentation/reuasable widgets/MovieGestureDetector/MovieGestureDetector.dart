import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/resources/constants.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';

class MovieGestureDetector extends StatelessWidget {
  const MovieGestureDetector({
    super.key,
    required this.selectedMovie,
    required this.onTap,
  });

  final MoviesVm selectedMovie;
  final Function()? onTap;   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: selectedMovie.poster == null
          ? Container(
              margin: EdgeInsets.only(right: 5).r,
              child: Column(
                children: [
                  Hero(
                    tag: selectedMovie,
                    child: Container(
                      height: 150.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                          child: Icon(Icons.image_not_supported_outlined,
                              color: Colors.white.withOpacity(0.3), size: 50)),
                    ).animate().fadeIn(
                        begin: 0.5,
                        duration: 1000.ms,
                        curve: Curves.easeInOutCubic),
                  ),
                  SizedBox(
                      key: Key(selectedMovie.title),
                      height: 20.h,
                      width: 118.w,
                      child: Center(
                        child: Text(
                          selectedMovie.title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ).animate().fadeIn(
                            begin: 0.5,
                            duration: 500.ms,
                            curve: Curves.easeInOut),
                      )),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(right: 5).r,
              child: Column(
                children: [
                  Hero(
                    tag: selectedMovie,
                    child: CachedNetworkImage(
                      imageUrl: '$imageURL${selectedMovie.poster}',
                      imageBuilder: (context, image) => Container(
                        height: 150.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        height: 150.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Transform.scale(
                          scale: 1.3,
                          child: const Center(
                              child: CupertinoActivityIndicator(
                                  color: Colors.red)),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 150.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ).animate().fadeIn(
                        begin: 0.5,
                        duration: 1000.ms,
                        curve: Curves.easeInOutCubic),
                  ),
                  SizedBox(
                      key: Key(selectedMovie.title),
                      height: 20.h,
                      width: 118.w,
                      child: Center(
                        child: Text(
                          selectedMovie.title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ).animate().fadeIn(
                            begin: 0.5,
                            duration: 500.ms,
                            curve: Curves.easeInOut),
                      )),
                ],
              ),
            ),
    );
  }
}
