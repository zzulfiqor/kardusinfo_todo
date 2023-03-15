// GoRouter configuration
import 'package:get/get.dart';
import 'package:kardusinfo_todo/core/router/route_name.dart';
import 'package:kardusinfo_todo/presentation/feature/login/login_screen.dart';
import 'package:kardusinfo_todo/presentation/feature/note/note_screen.dart';
import 'package:kardusinfo_todo/presentation/feature/splash/splash_screen.dart';

import '../../presentation/feature/login/binding/login_binding.dart';
import '../../presentation/feature/note/binding/note_binding.dart';
import '../../presentation/feature/signup/binding/signup_binding.dart';
import '../../presentation/feature/signup/signup_screen.dart';
import '../../presentation/feature/splash/binding/splash_binding.dart';

final List<GetPage> appRouter = [
  GetPage(
    name: RouteName.splash,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: RouteName.note,
    page: () => const NoteScreen(),
    binding: NoteBinding(),
  ),
  GetPage(
    name: RouteName.login,
    page: () =>  LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RouteName.signUp,
    page: () =>  SignUpScreen(),
    binding: SignUpBinding(),
  ),
  
  
];
