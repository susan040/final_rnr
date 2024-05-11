import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/repo/profile_repo.dart';
import '../../models/auth/user_model.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/custom_text_field.dart';
import '../auth/core_controller.dart';

class ProfileController extends GetxController {
  TextEditingController previousPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final coreController  = Get.find<CoreController>();
  
  Rxn<User> user = Rxn<User>(); 

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser(){
    user.value = coreController.currentUser.value;
  }

  final keys = GlobalKey<FormState>();
  changePassword() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      builder: ((context) {
        var theme = Theme.of(context);
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: keys,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 17,
                ),
                Container(
                  height: 5,
                  width: 105,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                Text(
                  "For security reasons it is recommended to change the default provided password.",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                CustomTextField(
                  textInputAction:
                         TextInputAction.next, textInputType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                  controller: previousPasswordController,
                  hint: "Old password",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textInputAction:
                         TextInputAction.next, textInputType: TextInputType.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                  controller: newPasswordController,
                  hint: "New password",
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedButton(
                    onTap: () async {
                      if (keys.currentState!.validate()) {
                        changePasswordFunction(context);
                      }
                    },
                    buttonText: "Confirm"),
                const SizedBox(
                  height: 28,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Skip",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
                // const SizedBox(
                //   height: 69,
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }

  changePasswordFunction(context) async {
    String oldPassword = previousPasswordController.text;
    String newPassword = newPasswordController.text;
    await ProfileRepo.changePasswordUser(
        oldPassword: oldPassword,
        newPassword: newPassword,
        onSuccess: () {
          Navigator.pop(context);
          CustomSnackBar.success(
            message: "Password changed successfully",
            title: "Password",
          );
        },
        onError: (message) {
          CustomSnackBar.error(
            message: message,
            title: "Password",
          );
        });
  }
}
