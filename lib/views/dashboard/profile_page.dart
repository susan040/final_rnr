import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/utils/colors.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';
import '../../controllers/auth/core_controller.dart';
import '../../controllers/dashboard/profile_controller.dart';
import '../../utils/image_paths.dart';
import '../../widgets/custom_profile_menu.dart';
import '../edit_profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final c = Get.find<ProfileController>();
  final controller = Get.find<CoreController>();
  final controllerHome = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: AppColors.primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/logo.png"))),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    imageUrl: c.user.value?.profileImageUrl ?? "",
                    errorWidget: (context, url, error) => Image.asset(
                      ImagePath.profilePlaceholder,
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                    height: 111,
                    width: 111,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text("${c.user.value?.name!.capitalize}",
                          style: CustomTextStyles.f16W400(color: Colors.white)),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Text("${c.user.value?.email!.capitalize}",
                          style: CustomTextStyles.f16W400(color: Colors.white)),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Text("${c.user.value?.phoneNumber}",
                          style: CustomTextStyles.f16W400(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          //profile menu
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
            child: Card(
              color: theme.colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Column(
                children: [
                  CustomProfileMenu(
                    onTap: () {
                      Get.to(() => EditProfile());
                    },
                    iocnData: ImagePath.profile,
                    label: "Edit Profile",
                  ),
                  CustomProfileMenu(
                    onTap: c.changePassword,
                    iocnData: ImagePath.password,
                    label: "Change Password",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.faq,
                    label: "FAQ",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.privacy,
                    label: "Privacy Policy",
                  ),
                  CustomProfileMenu(
                    onTap: () {},
                    iocnData: ImagePath.aboutUs,
                    label: "About Us",
                  ),
                  CustomProfileMenu(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Version'),
                        content: const Text('Version 1.1'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    iocnData: ImagePath.version,
                    label: "Version",
                  ),
                  // CustomProfileMenu(
                  //   onTap: () {},
                  //   iocnData: ImagePath.setting,
                  //   label: "Settings",
                  // ),
                  ListTile(
                    minVerticalPadding: 1.0,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    dense: true,
                    onTap: () {
                      controller.logOut();
                      final homeController = Get.find<HomePageController>();
                      homeController.endDateController.clear();
                      homeController.startDateController.clear();
                      homeController.endTimeController.clear();
                      homeController.startTimeController.clear();
                    },
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 0, left: 17),
                      child: SvgPicture.asset(
                        ImagePath.logout,
                        height: 20,
                        width: 20,
                        color: Colors.red,
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void myFunction(dynamic value) {
    controller.darkTheme.value = !controller.darkTheme.value;
    controller.update();
  }
}
