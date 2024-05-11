import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_and_ride/controllers/dashboard/profile_controller.dart';
import 'package:rent_and_ride/repo/update_profile.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../models/auth/user_model.dart';
import '../../utils/storage_keys.dart';
import '../../widgets/custom_snackbar.dart';
import '../auth/core_controller.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final coreController = Get.find<CoreController>();
  final profileController = Get.find<ProfileController>();

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);
  final picker = ImagePicker();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Rxn<User> user = Rxn<User>();
  Rxn<File> image = Rxn<File>();

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() {
    user.value = profileController.user.value;
    nameController.text = user.value!.name!;
    phoneController.text = user.value!.phoneNumber!;
    emailController.text = user.value!.email!;
  }

  void pickImage() async {
    log("Picking image");
    final pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 40,
        maxHeight: 500,
        maxWidth: 500);

    if (pickedImage != null) {
      image.value = File(pickedImage.path);
    }
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait ..");

      await UpdateProfileRepo.updateProfile(
        image: image.value,
        name: nameController.text,
        phone: phoneController.text,
        onSuccess: (user, message) async {
          loading.hide();
          final box = GetStorage();
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          coreController.currentUser.value = user;
          profileController.loadUser();
          // Get.offAll(() => ProfilePage());
          Get.back();
          CustomSnackBar.success(title: "Update Profile", message: message);
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "error Profile", message: message);
        },
      );
    }
  }
}
