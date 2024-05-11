import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/utils/image_paths.dart';
import 'package:rent_and_ride/views/dashboard/dash_screen.dart';
import '../controllers/auth/core_controller.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CoreController>();
    Timer(const Duration(seconds: 3), () {
      if (c.isUserLoggedIn()) {
        Get.offAndToNamed(DashScreen.routeName);
      } else {
        Get.offAndToNamed(LogInScreen.routeName);
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image(
                image: const AssetImage(ImagePath.logogif),
                height: Get.height / 3,
                width: Get.width / 2,
              ),
            ),
          ),
          const Center(
            child: CupertinoActivityIndicator(
              radius: 15,
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
