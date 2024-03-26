import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/resources/constants.dart';

class MovieTypeText extends StatelessWidget {
  const MovieTypeText({
    super.key,
    required this.movieType,
  });

  final String movieType;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieType,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          fontSize: 18.sp),
    ).animate().fadeIn(
                      begin: 0.5, duration: 200.ms, curve: Curves.easeInOut);
  }
}
