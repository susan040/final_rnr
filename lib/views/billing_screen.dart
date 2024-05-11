import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/billing_controller.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/models/vehicle.dart';
import 'package:rent_and_ride/utils/colors.dart';
import 'package:rent_and_ride/views/payment_screen.dart';
import 'package:rent_and_ride/widgets/custom_button.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../controllers/auth/core_controller.dart';

class BillingScreen extends StatelessWidget {
  BillingScreen({super.key, required this.singleVehicle});

  final Vehicle singleVehicle;
  final c = Get.put(BillingController());
  final homeController = Get.find<HomePageController>();
  final coreController = Get.find<CoreController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    c.costPerHour = singleVehicle.costPerHour!;
    c.vehicleId.value = singleVehicle.id!;
    c.vendorId.value = singleVehicle.vendor!.id!;

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
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height - 300,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.colorScheme.tertiary,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4, 4),
                      blurRadius: 9,
                      color: const Color(0xFF494949).withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    ClipRRect(
                      borderRadius: (BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        fit: BoxFit.fill,
                        height: Get.height / 6,
                        width: Get.width / 2.5,
                        imageUrl: singleVehicle.imageUrl!,
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/background.png',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          singleVehicle.vehicleName ?? "",
                          style: textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation: singleVehicle.vendor!.shopAddress ?? "",
                          title: 'Shop Address',
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation:
                              "${homeController.startDateController.text} ${homeController.startTimeController.text}",
                          title: 'To',
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation:
                              "${homeController.endDateController.text} ${homeController.endTimeController.text}",
                          title: 'From',
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation: c.duration.value,
                          title: 'Total Time',
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation: singleVehicle.costPerHour.toString(),
                          title: 'Cost per hour',
                        ),
                        CalculationRow(
                          textTheme: textTheme,
                          theme: theme,
                          calculation: c.totalAmount.toString(),
                          title: 'Calucation amount',
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: List.generate(
                            150 ~/ 2,
                            (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Colors.grey,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: textTheme.bodyLarge!
                                  .copyWith(color: AppColors.primaryColor
                                      // color: theme.colorScheme.secondary,
                                      ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rs ',
                                  style: textTheme.bodyLarge!
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                                Obx(
                                  () => Text(
                                    c.totalAmount.toInt().toString(),
                                    style: textTheme.bodyLarge!.copyWith(
                                        color: AppColors.primaryColor
                                        // color: theme.colorScheme.secondary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                // height: 54,
                padding: const EdgeInsets.all(20),

                child: Flexible(
                  child: Text(
                    'Please note that you cannot cancel your confirmed booking after 30 minutes of confirmation.',
                    maxLines: 3,
                    style: CustomTextStyles.f12W600(color: Colors.red),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () => Get.to(() => PaymentScreen()),
            buttonText: 'Make Payment',
          )),
    );
  }
}

class CalculationRow extends StatelessWidget {
  const CalculationRow({
    super.key,
    required this.textTheme,
    required this.theme,
    required this.title,
    required this.calculation,
  });

  final TextTheme textTheme;
  final ThemeData theme;

  final String title;
  final String calculation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(calculation,
              style: textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.secondary,
              )),
        ],
      ),
    );
  }
}
