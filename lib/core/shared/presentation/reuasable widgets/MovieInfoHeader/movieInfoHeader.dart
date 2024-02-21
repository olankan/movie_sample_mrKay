import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import '../../../../resources/constants.dart';
import '../../../data/repository/genre_Repository_impl.dart';
import '../../providers/providers.dart';
import '../customContainer/customContainer.dart';
import '../../view models/moviesVm.dart';

class MovieInfoHeader extends StatelessWidget {
  const MovieInfoHeader({
    super.key,
    required this.selectedMovie,
    required this.isNotified,
  });

  final MoviesVm? selectedMovie;
  final bool isNotified;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final _currentMovieIndex = ref.watch(movieIndex);
        // final _previousMovieIndex = ref.watch(previousMovieIndex);
        //  final pageChanged = ref.watch(isChanged);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: Row(
                children: [
                  SizedBox(
                      key: Key(selectedMovie!.title),
                      height: 42.h,
                      width: 295.w,
                      child: selectedMovie!.title.length > 16
                          ? Marquee(
                              text: selectedMovie!.title,
                              style: TextStyle(
                                fontFamily: fontFamily,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w900,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              blankSpace: 20.0,
                              accelerationDuration: 200.ms,
                              pauseAfterRound: 200.ms,
                            ).animate().fadeIn(
                              begin: 0.5,
                              duration: 500.ms,
                              curve: Curves.easeInOut)
                          : //
                          Text(
                              selectedMovie!.title,
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w900,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ).animate().fadeIn(
                              begin: 0.5,
                              duration: 500.ms,
                              curve: Curves.easeInOut)),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: SizedBox(
                key: Key(selectedMovie!.genreId![0].toString()),
                height: 20.0.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedMovie!.genreId!.length,
                  itemBuilder: (BuildContext context, int index) {
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
                              GenreInfo().getGenreNameById(
                                  selectedMovie!.genreId![index]),
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
                          visible: index != selectedMovie!.genreId!.length - 1,
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
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: Row(
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
                        decorationThickness: 2,
                        decorationColor: Colors.white.withOpacity(0.8),
                        fontSize: 15.sp,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    TextSpan(
                      text: '${selectedMovie!.voteCount} votes',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor: Colors.white.withOpacity(0.8),
                        fontSize: 14.sp,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )
                  ])).animate().fadeIn(
                      begin: 0.5,
                      duration: 1000.ms,
                      curve: Curves.easeInOutCubic),
                ],
              ),
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