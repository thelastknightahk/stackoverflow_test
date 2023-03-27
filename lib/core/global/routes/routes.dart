import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sof/presentation/features/home/home_page.dart';
import 'package:sof/presentation/features/splash/splash_page.dart';
import 'package:sof/presentation/features/user_detail/user_detail_page.dart';
class Routes {
    static GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        //  GoRoute(
        //   path: 'UserDetailReputation',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return   UserDetailPage(userModelData: null,);
        //   },
        // ),
      ],
    ),
  ],
);
}