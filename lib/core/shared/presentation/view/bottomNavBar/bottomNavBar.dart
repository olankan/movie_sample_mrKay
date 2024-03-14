import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../providers/sharedProviders.dart';
import '../../../../../features/Home/presentation/Widgets/IconData/iconData.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({
    super.key,
    required this.selectedNavIndex,
  });

  final int selectedNavIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pressed = ref.watch(onPressed);
    return Container(
      height: 75.h,
      width: 390.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(90), topRight: Radius.circular(90)),
          color: Colors.black.withOpacity(0.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            BottomBarIconData.untappedIcons.length,
            (index) => GestureDetector(
              onTap: () {
                ref.watch(movieIndex.notifier).state = 0;
                ref.watch(navIndex.notifier).state = index;
                ref.watch(onPressed.notifier).state = !pressed;
              },
              child: Icon(
                selectedNavIndex == index
                    ? BottomBarIconData.tappedIcons[index]
                    : BottomBarIconData.untappedIcons[index],
                size: 30.r,
                color: selectedNavIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
