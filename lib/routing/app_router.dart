import 'package:go_router/go_router.dart';

import '../models/university.dart';
import '../views/detail_screen.dart';
import '../views/home_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            final university = state.extra as University;
            return DetailScreen(university: university);
          },
        ),
      ],
    ),
  ],
);
