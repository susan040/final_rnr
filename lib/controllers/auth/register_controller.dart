import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../models/auth/user_model.dart';
import '../../repo/auth_repo.dart';
import '../../utils/storage_keys.dart';
import '../../views/dashboard/dash_screen.dart';
import '../../widgets/custom_snackbar.dart';
import 'core_controller.dart';

class RegisterController extends GetxController {
  var registerFormKey = GlobalKey<FormState>();

  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  var passwordObscure = true.obs;
  var confirmPasswordObscure = true.obs;

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onConfirmEyeClick() {
    confirmPasswordObscure.value = !confirmPasswordObscure.value;
  }

  void submit() async {
    if (registerFormKey.currentState!.validate()) {
      loading.show(message: "signing up ...");
      User user = User(
        name: usernameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
      );
      await AuthRepo.registerUser(
        user: user,
        password: passwordController.text,
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(
              StorageKeys.ACCESS_TOKEN, json.encode(token.toJson()));
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          // print("on submit ma aayo ${user.name}");
          Get.find<CoreController>().loadCurrentUser();

          // print("on submit ma aayo ${user.email}");
          Get.offAllNamed(DashScreen.routeName);
          CustomSnackBar.success(title: "Sign up succesful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Signup", message: message);
        },
      );
    }
  }
}
