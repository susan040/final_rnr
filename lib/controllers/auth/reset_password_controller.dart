import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/auth/otp_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/forget_password_repo.dart';
import '../../views/auth/login_screen.dart';
import '../../widgets/custom_snackbar.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  // ForgetPasswordController fbController = Get.find<ForgetPasswordController>();

  // String? email;

 var passwordObscure = true.obs;
  var confirmPasswordObscure = true.obs;
    void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onConfirmEyeClick() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }
  final newPassController = TextEditingController();
  final emailController = TextEditingController();
  final conPassController = TextEditingController();
  // final otpController = TextEditingController();

  // RxBool newPassObscure = true.obs;
  // RxBool conPassObscure = true.obs;

  // void onEyeCLick() {
  //   newPassObscure.value = !newPassObscure.value;
  // }

  // void onconEyeCLick() {
  //   conPassObscure.value = !conPassObscure.value;
  // }

  final con = Get.find<OTPController>();
  void onSubmit(int cusId) async {
    if (formKey.currentState!.validate()) {
      log("onsubmit pachi ko ");
      // log("id -------${fbController.otpDetails?.customer.toString()}");

      loading.show(message: "PLease wait ..");
      await ForgetPasswordRepo.resetPassword(
        id: (cusId.toString()),
        otp: (con.otpCOntroller.text).toString(),
        password: newPassController.text,
        onSuccess: (message) async {
          loading.hide();
          Get.offAllNamed(LogInScreen.routeName);
          CustomSnackBar.success(title: "Reset Password", message: message);
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Reset Password", message: message);
        },
      );
    }
  }
}
