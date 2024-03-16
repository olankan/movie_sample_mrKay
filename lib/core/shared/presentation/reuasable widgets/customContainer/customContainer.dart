import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.radius,
    this.borderColor,
    this.gradient,
    this.child,
  });

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? radius;
  final Color? borderColor;
  final Widget? child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? 50.w,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 14),
          border: Border.all(color: borderColor ?? Colors.transparent),
          gradient: gradient),
      child: child,
    );
  }
}
