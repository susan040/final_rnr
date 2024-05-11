import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/utils/custom_password_fields.dart';
import 'package:rent_and_ride/utils/validators.dart';
import 'package:rent_and_ride/views/auth/register_screen.dart';
import 'package:rent_and_ride/widgets/custom_text_field.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';
import '../../controllers/auth/login_controller.dart';
import '../../utils/colors.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  static const routeName = "/login";
  final c = Get.find<LoginController>();

  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 4,
                width: double.infinity,
                child: Image(
                  image: const AssetImage(ImagePath.logo),
                  height: Get.height / 4,
                  width: Get.width / 2,
                ),
              ),
              Form(
                key: keys,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Log In",
                        style: CustomTextStyles.f24W600(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Please sign in to continue",
                        style: CustomTextStyles.f14W400(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email Address",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        validator: Validators.checkEmailField,
                        controller: c.emailTextController,
                        hint: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: CustomTextStyles.f14W400(),
                      ),

                      Obx(
                        () => CustomPasswordField(
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeClick,
                          controller: c.passwordTextController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: TextButton(
                      //     onPressed: () {
                      //       // Get.to(() => ForgotPasswordScreen());
                      //     },
                      //     child: Text(
                      //       "Forgot Password",
                      //       style: CustomTextStyles.f14W400(
                      //           color: AppColors.primaryColor),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          c.onSubmit();
                        },
                        buttonText: 'Login',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have a account ? ",
                            style: CustomTextStyles.f14W400(),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => LogInScreen());
                            },
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(RegisterPage.routeName);
                              },
                              child: Text(
                                "Create one",
                                style: CustomTextStyles.f14W400(
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
