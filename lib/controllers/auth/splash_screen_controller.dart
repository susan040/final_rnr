import 'dart:async';

import 'package:get/get.dart';
import 'package:rent_and_ride/views/dashboard/dash_screen.dart';

import '../../views/auth/login_screen.dart';
import 'core_controller.dart';

class SplashController extends GetxController {
  final c = Get.find<CoreController>();

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggedIn()) {
        Get.offAndToNamed(DashScreen.routeName);
      } else {
        Get.offAndToNamed(LogInScreen.routeName);
      }
    });
  }
}
