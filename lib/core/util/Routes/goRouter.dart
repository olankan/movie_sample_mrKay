import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_sample/core/shared/presentation/view/bottomBarRouter/bottomBarRouter.dart';
import 'package:movie_sample/features/movie%20Description/presentation/pages/description.dart';

import 'package:movie_sample/features/movie%20Description/presentation/view_mrKay/description/description_mrKay.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const BottomNavBarRouter(),
      routes: <RouteBase>[
        GoRoute(
          path: 'description2',
          builder: (BuildContext context, GoRouterState state) =>
              const MrKayMovieDescription(),
        ), GoRoute(
          path: 'description',
          builder: (BuildContext context, GoRouterState state) =>
              const MovieDescription(),
        ),
        // GoRoute(
        //   path: 'movie categories',
        //   builder: (BuildContext context, GoRouterState state) =>
        //     const  MovieCategoriesScreen(),
        // ),
      ],
    ),
  ],
);
