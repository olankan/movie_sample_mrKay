// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_is_empty

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:movie_sample/core/resources/constants.dart';
import 'package:movie_sample/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';

class MovieReviewCard extends ConsumerWidget {
  const MovieReviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final reviews = ref.watch(movieCastCreditsProvider);
    final reviews = ref.watch(movieReviewsProvider);

    return reviews.when(
      data: (reviews) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: fontFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                reviews.length == 1 || reviews.length == 0
                    ? Text(
                        '${reviews.length} Review',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                          decorationColor: Colors.white.withOpacity(0.8),
                          fontSize: 15.sp,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    : Text(
                        '${reviews.length} Reviews',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 3,
                          decorationColor: Colors.white,
                          fontSize: 15.sp,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomContainer(
              height: 230.h,
              width: double.infinity,
              radius: 22.r,
              backgroundColor: Colors.transparent,
              child: reviews.isEmpty
                  ? CustomContainer(
                      height: 230.h,
                      width: 300.w,
                      radius: 22.r,
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: Center(
                          child: Text(
                        'No Review Yet.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        final review = reviews[index];
                        // final reviewDate = reviews[index].reviewDate.toString;
                        // ref.watch(reviewLength.notifier).state = reviews.length;
                        // print(review.author);
                        //  print(review.castName);
                        return Row(
                          children: [
                            CustomContainer(
                              backgroundColor: Colors.black.withOpacity(0.17),
                              height: 230.h,
                              width: 300.w,
                              radius: 22.r,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0)
                                        .r,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text('${review.reviewDate}',
                                        // textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: fontFamily,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 7.h),
                                    CustomContainer(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.12),
                                      radius: 10.r,
                                      height: 135.h,
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              // review.castName!,
                                              review.authorContent!,
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: fontFamily,
                                                  fontSize: 14.sp)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'By',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 7.w),
                                            review.authorName!.length > 16
                                                ? SizedBox(
                                                    width: 140.w,
                                                    height: 20.h,
                                                    child: Center(
                                                      child: Marquee(
                                                        text:
                                                            review.authorName!,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              fontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationThickness:
                                                              3,
                                                          decorationColor:
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.8),
                                                        ),
                                                        blankSpace: 20.0,
                                                        accelerationDuration:
                                                            200.ms,
                                                        pauseAfterRound: 200.ms,
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    review.authorName!,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: fontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      decorationThickness: 3,
                                                      decorationColor: Colors
                                                          .white
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                       review.authorRating == null ? Row(
                                          children: [
                                            Icon(Icons.star,
                                                    color: Colors.grey,
                                                    size: 18.r)
                                                .animate()
                                                .fadeIn(
                                                    begin: 0.5,
                                                    duration: 1000.ms,
                                                    curve:
                                                        Curves.easeInOutCubic),
                                            Text(
                                              'No Rating',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: fontFamily,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ) : Row(
                                          children: [
                                            Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 14.r)
                                                .animate()
                                                .fadeIn(
                                                    begin: 0.5,
                                                    duration: 1000.ms,
                                                    curve:
                                                        Curves.easeInOutCubic),SizedBox(width: 1.w),
                                            Text(
                                              '${review.authorRating!.round()}/10',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: fontFamily,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w)
                          ],
                        );
                      }),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => Center(
        child: Transform.scale(
          scale: 1.3,
          child: SizedBox(
              height: 180.h,
              child: CupertinoActivityIndicator(
                  color: Colors.white.withOpacity(0.8))),
        ),
      ),
    );
  }
}
