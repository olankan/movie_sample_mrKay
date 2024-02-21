import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/shared/presentation/providers/providers.dart';
import 'package:movie_sample/core/shared/presentation/view/bottomNavBar/bottomNavBar.dart';
import 'package:movie_sample/features/Home/presentation/view/home.dart';


import '../../../../../features/movieCategories/presentation/pages/movieCategories.dart';
import '../../../../../features/profile/presentation/pages/profile.dart';

class BottomNavBarRouter extends ConsumerWidget {
  const BottomNavBarRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavIndex = ref.watch(navIndex);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        selectedNavIndex == 0
            ? const HomeNew()
            : selectedNavIndex == 1
                ? const MovieCategoriesScreen()
                : const ProfilePage(),
        Positioned(
          top: 824.h,
          left: 20.w,
          child: BottomNavBar(selectedNavIndex: selectedNavIndex)),
      ]),
    );
  }
}
