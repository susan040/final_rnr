import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/auth/core_controller.dart';
import 'package:rent_and_ride/controllers/billing_controller.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/utils/image_paths.dart';
import 'package:rent_and_ride/utils/payment_button.dart';
import 'package:rent_and_ride/widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({
    super.key,
  });

  final c = Get.put(BillingController());
  final homeController = Get.find<HomePageController>();
  final coreController = Get.find<CoreController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Payment Method",
                style: textTheme.titleLarge!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Obx(
                () => Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    PaymentButton(
                      name: 'Cash Payment',
                      image: ImagePath.esewa,
                      isSelected: c.selectedPayment.value == 'esewa',
                      onTap: () => c.updateSelectedPayment('esewa'),
                    ),
                    PaymentButton(
                      name: 'Khalti',
                      isSelected: c.selectedPayment.value == 'khalti',
                      image: ImagePath.khalti,
                      onTap: () => c.updateSelectedPayment('khalti'),
                    ),
                  ],
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
            onTap: () {
              c.lastPage(context);
            },
            buttonText: 'Continue',
          )),
    );
  }
}
