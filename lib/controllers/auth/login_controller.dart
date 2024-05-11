import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rent_and_ride/controllers/auth/core_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/auth_repo.dart';
import '../../utils/storage_keys.dart';
import '../../views/dashboard/dash_screen.dart';
import '../../widgets/custom_snackbar.dart';
import '../dashboard/home_controller.dart';

class LoginController extends GetxController {
  var passwordObscure = true.obs;
  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  final homeController = Get.find<HomePageController>();

  void onSubmit() async {
    loading.show(message: "loggin in ..");
    await AuthRepo.loginUser(
      email: emailTextController.text,
      password: passwordTextController.text,
      onSuccess: (user, token) async {
        loading.hide();
        final box = GetStorage();
        await box.write(StorageKeys.ACCESS_TOKEN, json.encode(token.toJson()));
        await box.write(StorageKeys.USER, json.encode(user.toJson()));
        Get.find<CoreController>().loadCurrentUser();
        Get.offAllNamed(DashScreen.routeName);
        CustomSnackBar.success(
            title: "Login Successful", message: "Logged in succesfully");
      },
      onError: (message) {
        loading.hide();
        CustomSnackBar.error(message: message, title: "Login");
      },
    );
  }
}
