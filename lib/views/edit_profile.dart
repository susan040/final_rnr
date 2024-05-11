import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/widgets/custom_button.dart';
import 'package:rent_and_ride/widgets/custom_text_field.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../controllers/dashboard/edit_profile_controller.dart';
import '../utils/colors.dart';
import '../utils/image_paths.dart';
import '../utils/validators.dart';

class EditProfile extends StatelessWidget {
  static const String routeName = "/edit-profile";
  EditProfile({super.key});

  final c = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Obx(
                  () => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: (c.image.value != null)
                        ? Image.file(
                            c.image.value!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          )
                        : CachedNetworkImage(
                            imageUrl: c.user.value?.profileImageUrl ?? "",
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              ImagePath.profilePlaceholder,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextButton(
                  onPressed: c.pickImage,
                  child: const Text(
                    "Change Avatar",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  controller: c.nameController,
                  hint: "Full Name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  validator: Validators.checkFieldEmpty,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextField(
                  controller: c.phoneController,
                  hint: "Phone Number",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  validator: Validators.checkPhoneField,
                ),
                const SizedBox(
                  height: 17,
                ),
                CustomTextField(
                  controller: c.emailController,
                  // labelText: "Email",
                  hint: "Email",
                  readOnly: true,
                  // border: AppColors.lGrey,
                  textInputAction: TextInputAction.none,
                  textInputType: TextInputType.none,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Please note that you cannot edit your email',
                  style: CustomTextStyles.f14W600(color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: CustomElevatedButton(
                    onTap: () {
                      c.submit();
                    },
                    buttonText: 'Edit Profile',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
