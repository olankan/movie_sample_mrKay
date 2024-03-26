import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/resources/constants.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movie%20credits%20vm/movieCredits.vm.dart';


class CastCharacter extends StatelessWidget {
  const CastCharacter({
    super.key,
    required this.credit,
  });

  final MovieCreditsVm credit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: credit.castCharacter == ''
          ? RichText(
              text: TextSpan(children: [
              TextSpan(
                  text: 'as an ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: fontFamily,
                  )),
              TextSpan(
                text: 'Extra',
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ]))
          : RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'as ',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: fontFamily,
                      color: Colors.white,
                    )),
                TextSpan(
                  text: credit.castCharacter,
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )
              ])),
    );
  }
}
