import 'package:encuestop/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder:(_) => Container(
          child: Center(
            child: Text("SPLASH SCREEN"),
          ),
        ),
      ),
    );
  }
}
