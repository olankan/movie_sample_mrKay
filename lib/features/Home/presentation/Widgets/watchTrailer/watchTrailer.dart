import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';

class WatchTrailer extends StatelessWidget {
  const WatchTrailer({
    super.key,
    required int? currentMovieIndex,
  }) : _currentMovieIndex = currentMovieIndex;

  final int? _currentMovieIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/description'),
      child: CustomContainer(
        key: Key('$_currentMovieIndex'),
        width: 118.w,
        height: 35.h,
        radius: 30.r,
        backgroundColor: Colors.black.withOpacity(0.3),
        child: Row(children: [
          SizedBox(width: 3.w),
          Icon(
            Icons.play_circle_outline,
            color: Colors.white.withOpacity(0.8),
          )
              .animate()
              .fadeIn(
                begin: 0.2,
                duration: 2.5.seconds,
              )
              .then(delay: 1.seconds)
              .shake(offset: const Offset(1, 0), duration: 1.seconds, hz: 2)
              .fadeOut(
                duration: 1.5.seconds,
              ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            'Watch Trailer',
            style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.sp,
                fontFamily: fontFamily,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 3.w,
          ),
        ]),
      ),
    );
  }
}