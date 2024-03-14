// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/util/Routes/goRouter.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      // enabled: true, 
      builder: (BuildContext context) => ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 930),
        builder: (context, child) => MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              builder: DevicePreview.appBuilder,
              title: 'Movie',
            ));
  }
}
