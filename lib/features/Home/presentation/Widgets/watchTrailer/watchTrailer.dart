import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_sample/core/shared/presentation/providers/sharedProviders.dart';
import '../../../../../core/resources/constants.dart';
import '../../../../../core/shared/presentation/reuasable widgets/customContainer/customContainer.dart';

class WatchTrailer extends ConsumerWidget {
  const WatchTrailer({
    super.key,
    required int? currentMovieIndex,
  }) : _currentMovieIndex = currentMovieIndex;

  final int? _currentMovieIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      // onTap: () { ref.watch(heroTagProvider.notifier).state = selectedMovie;
      
                 
                  // context.go('/description');} ,
      child: CustomContainer(
        key: Key('$_currentMovieIndex'),
        width: 118.w,
        height: 35.h,
        radius: 30.r,
        backgroundColor: Colors.black.withOpacity(0.3),
        child: Row(children: [
          SizedBox(width: 3.w),
          const Icon(
            Icons.play_circle_outline,
            color: Colors.white,
          )
              .animate()
              .fadeIn(
                begin: 0.2,
                duration: 1.seconds,
              ),
              
              
          SizedBox(
            width: 3.w,
          ),
          Text(
            'Watch Trailer',
            style: TextStyle(
                color: Colors.white,
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
