import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/billing_controller.dart';
import 'package:rent_and_ride/models/vehicle.dart';
import 'package:rent_and_ride/views/billing_screen.dart';
import 'package:rent_and_ride/widgets/custom_button.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../utils/colors.dart';

class SinglePage extends StatelessWidget {
  static const routeName = "/single_page";
  const SinglePage({super.key, required this.vehicle});

  final Vehicle vehicle;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          vehicle.vehicleName ?? "",
          style: CustomTextStyles.f16W600(color: AppColors.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25, top: 17),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height / 2.7,
                  imageUrl: vehicle.imageUrl!,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/logo.png',
                    height: MediaQuery.of(context).size.height / 2.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4, 4),
                    blurRadius: 9,
                    color: const Color(0xFF494949).withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                    ),
                    child: Text(
                      "Overview",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      vehicle.vehicleDescription ?? "",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: const Color.fromRGBO(
                          161,
                          161,
                          161,
                          1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                    ),
                    child: Text(
                      "Document Required",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      vehicle.documentRequired ?? "",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: const Color.fromRGBO(
                          161,
                          161,
                          161,
                          1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Other Details",
                          style: theme.textTheme.titleLarge!
                              .copyWith(color: theme.colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 7,
                          top: 8,
                        ),
                        child: Text(
                          "Seat: ${vehicle.seat ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 16,
                          top: 8,
                        ),
                        child: Text(
                          "Fuel Type: ${vehicle.fuelType ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 7,
                          top: 8,
                        ),
                        child: Text(
                          "Type: ${vehicle.trasmissionType ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 16,
                          top: 8,
                        ),
                        child: Text(
                          "Mileage: ${vehicle.mileage ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 7,
                          top: 8,
                        ),
                        child: Text(
                          "Brand: ${vehicle.brandName ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 16,
                          top: 8,
                        ),
                        child: Text(
                          "Color: ${vehicle.color ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 7,
                          top: 8,
                        ),
                        child: Text(
                          "Fuel: ${vehicle.fuelType ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(
                      "Vehicle Number:  ${vehicle.vehicleNumber ?? ""}",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16, color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(
                      "Cost: Rs ${vehicle.costPerHour ?? ""}",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16, color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Text(
                      "Vendor Details ",
                      style: CustomTextStyles.f16W600(),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${vehicle.vendor!.name ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Phone: ${vehicle.vendor!.phoneNumber ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Email: ${vehicle.vendor!.email ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Shop Address: ${vehicle.vendor!.shopAddress ?? ""}",
                          style: CustomTextStyles.f14W400(),
                        ),
                      ],
                    ),
                  ),
                  const IntrinsicHeight(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () {
              final billCon = Get.put(BillingController());
              billCon.calculateTotal(vehicle.costPerHour!);
              Get.to(() => BillingScreen(
                    singleVehicle: vehicle,
                  ));
            },
            buttonText: 'Book Now',
          )),
    );
  }
}
