import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo/presentation/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (_) {
          return Center(
            child: Hero(
              tag: 'applogo',
              child: Image.asset(
                'assets/images/logo.png',
                width: size.width * .7,
              ),
            ),
          );
        },
      ),
    );
  }
}
