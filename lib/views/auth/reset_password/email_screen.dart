import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/views/auth/reset_password/header.dart';

import '../../../controllers/auth/forget_password_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/validators.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = "/forget-password";
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final c = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const OtpHeader(),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.09,
                bottom: 0.0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.82,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0),
                    ),
                  ),
                  child: const Align(
                      child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Enter Your Email Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: c.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: c.emailController,
                              hint: "Email",
                              validator: Validators.checkEmailField,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "We will send you a One Time Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
                      child: CustomElevatedButton(
                          onTap: c.onSubmit, buttonText: "Verify and Continue"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
