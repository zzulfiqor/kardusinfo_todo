import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kardusinfo_todo/core/helper/auth_helper.dart';
import 'package:kardusinfo_todo/core/router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool? user = AuthHelper().isUserLoggedIn();
  log("UserLoggedIn ? " + user.toString());

  // Run the App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kardusinfo ToDo',
      routerConfig: appRouter,
    );
  }
}
