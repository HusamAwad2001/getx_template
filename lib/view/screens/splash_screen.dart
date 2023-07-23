import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  _splash() async {
    await Future.delayed(1.5.seconds);
    Get.offNamed(Routes.homePage);
  }

  @override
  Widget build(BuildContext context) {
    _splash();
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
