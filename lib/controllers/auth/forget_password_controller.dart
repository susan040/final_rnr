import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/models/otp.dart';
import 'package:rent_and_ride/views/auth/reset_password/otp_screen.dart';

import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../repo/forget_password_repo.dart';
import '../../widgets/custom_snackbar.dart';

class ForgetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final emailController = TextEditingController();

  OtpMail? otpDetails;

  // var otpController = Get.put(OTPController());
  // final otpController = Get.find<OTPController>();
  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "PLease wiat ..");
      await ForgetPasswordRepo.forgetPassword(
        email: emailController.text,
        onSuccess: (userId) {
          loading.hide();

          otpDetails = userId;

          // log('on submit ko userId${otpDetails!.otp}');
          // otpController.id.value = otpDetails!.otp.toString();

          Get.offNamed(OtpScreen.routeName, arguments: [emailController.text]);
          CustomSnackBar.success(
              title: "Forget Password",
              message: "Please Proceed to Reset Password");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Forget Password", message: message);
        },
      );
    }
  }
}
