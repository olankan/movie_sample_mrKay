
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:go_router/go_router.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ref.watch(movieIndex.notifier).state = 0;
        context.pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20.0).r,
        child: GlassmorphicContainer(
          width: 50.w,
          height: 50.h,
          borderRadius: 16.r,
          border: 0,
          blur: 20,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.1),
              Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: [0.1, 1],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0),
              Color((0xFFFFFFFF)).withOpacity(0),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20.r,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ).animate().slide(
              duration: 500.ms,
              delay: 200.ms,
            ),
      ),
    );
  }
}
