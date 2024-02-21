import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_sample/features/Home/presentation/view/home.dart';
import 'package:movie_sample/features/Home/presentation/view/sample.dart';
import 'package:movie_sample/features/movie%20Description/presentation/view/description.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomeNew(),
      routes: <RouteBase>[
        GoRoute(
          path: 'description',
          builder: (BuildContext context, GoRouterState state) =>
            const  MovieDescription(),
        ),
      ],
    ),
  ],
);
