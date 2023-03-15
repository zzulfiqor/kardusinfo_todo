import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kardusinfo_todo/core/router/app_router.dart';
import 'package:get/get.dart';
import 'core/binding/main_binding.dart';
import 'core/router/route_name.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting('id_ID', null);

  // Run the App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kardusinfo ToDo',
      getPages: appRouter,
      initialRoute: RouteName.splash,
      initialBinding: MainBinding(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
