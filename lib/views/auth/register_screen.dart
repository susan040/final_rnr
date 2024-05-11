import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/utils/custom_password_fields.dart';
import 'package:rent_and_ride/views/auth/login_screen.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';
import '../../controllers/auth/register_controller.dart';
import '../../utils/colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  final c = Get.put(RegisterController());
  RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height / 8,
                    width: Get.width / 3,
                    child: const Image(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Form(
                key: c.registerFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create New Account",
                        style: TextStyle(
                          fontFamily: "WorkSans",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Full Name",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: c.usernameController,
                        hint: "Full Name",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        validator: Validators.checkFieldEmpty,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Email Address",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: c.emailController,
                        hint: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        validator: Validators.checkEmailField,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Phone Number",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        controller: c.phoneNumberController,
                        hint: "Phone Number",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        validator: Validators.checkPhoneField,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => CustomPasswordField(
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeClick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Confirm Password",
                        style: CustomTextStyles.f14W400(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Obx(
                        () => CustomPasswordField(
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeClick,
                          controller: c.confirmPasswordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          c.submit();
                        },
                        buttonText: 'Register',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: CustomTextStyles.f14W400(),
                          ),
                          InkWell(
                            onTap: () {
                              Get.off(() => LogInScreen());
                            },
                            child: Text(
                              " Log In",
                              style: CustomTextStyles.f14W400(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
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
