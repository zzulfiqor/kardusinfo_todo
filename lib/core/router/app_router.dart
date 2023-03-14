// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:kardusinfo_todo/core/router/route_name.dart';
import 'package:kardusinfo_todo/presentation/feature/note/note_screen.dart';
import 'package:kardusinfo_todo/presentation/feature/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteName.splash,
  routes: [
    GoRoute(
      path: RouteName.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteName.note,
      builder: (context, state) => const NoteScreen(),
    ),
  ],
);
