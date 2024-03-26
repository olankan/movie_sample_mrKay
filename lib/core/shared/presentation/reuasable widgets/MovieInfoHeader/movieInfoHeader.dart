import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import '../../../../resources/constants.dart';
import '../../../data/repository/genreRepoImpl/genre_Repository_impl.dart';
import '../../providers/sharedProviders.dart';
import '../customContainer/customContainer.dart';
import '../../view models/movies vm/moviesVm.dart';

class MovieInfoHeader extends StatelessWidget {
  const MovieInfoHeader({
    super.key,
    required this.selectedMovie,
    this.isNotified,
  });

  final MoviesVm? selectedMovie;
  final bool? isNotified;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // final _currentMovieIndex = ref.watch(movieIndex);
        // final _previousMovieIndex = ref.watch(previousMovieIndex);
        //  final pageChanged = ref.watch(isChanged);
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                    key: Key(selectedMovie!.title),
                    height: 42.h,
                    width: 295.w,
                    child:
                        // selectedMovie!.title.length > 16
                        //     ? Marquee(
                        //         text: selectedMovie!.title,
                        //         style: TextStyle(
                        //           fontFamily: fontFamily,
                        //           fontSize: 30.sp,
                        //           fontWeight: FontWeight.w900,
                        //           color: Colors.white,
                        //         ),
                        //         blankSpace: 20.0,
                        //         accelerationDuration: 200.ms,
                        //         pauseAfterRound: 200.ms,
                        //       ).animate().fadeIn(
                        //         begin: 0.5,
                        //         duration: 500.ms,
                        //         curve: Curves.easeInOut)
                        //     : //
                        Text(
                      selectedMovie!.title,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ).animate().fadeIn(
                            begin: 0.5,
                            duration: 500.ms,
                            curve: Curves.easeInOut)),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              key: Key(selectedMovie!.genreId[0].toString()),
              height: 20.0.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedMovie!.genreId.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.h,
                        width: null,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10).r,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 4.0).r,
                          child: Text(
                            
                            GenreInfo().getGenreNameById(
                                selectedMovie!.genreId[index]),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: fontFamily,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ).animate().fadeIn(
                          begin: 0.5,
                          duration: 1000.ms,
                          curve: Curves.easeInOutCubic),
                      Visibility(
                        visible: index != selectedMovie!.genreId.length - 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0).r,
                          child: CustomContainer(
                            backgroundColor: Colors.white,
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
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              key: Key(selectedMovie!.rating.toString()),
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 18.r)
                    .animate()
                    .fadeIn(
                        begin: 0.5,
                        duration: 1000.ms,
                        curve: Curves.easeInOutCubic),
                SizedBox(
                  width: 2.w,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: '${selectedMovie!.rating.toStringAsFixed(1)}/10 ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '${selectedMovie!.voteCount} votes',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                      decorationColor: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ])).animate().fadeIn(
                    begin: 0.5,
                    duration: 1000.ms,
                    curve: Curves.easeInOutCubic),
              ],
            ),
          ],
        );
      },
    );
  }
}

// .animate().fadeIn(
//                       duration: Duration(seconds: 1),
//                       curve: Curves.decelerate);
