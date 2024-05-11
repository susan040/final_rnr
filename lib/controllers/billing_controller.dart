import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:rent_and_ride/controllers/dashboard/home_controller.dart';
import 'package:rent_and_ride/controllers/payment_controller.dart';
import 'package:rent_and_ride/repo/order_repo.dart';
import 'package:rent_and_ride/views/confirm_order.dart';
import '../widgets/custom_snackbar.dart';

class BillingController extends GetxController {
  final homeController = Get.find<HomePageController>();
  final formKey = GlobalKey<FormState>();
  RxBool loading = false.obs;
  // final currentStep = 0.obs;

  PaymentController paymentController = Get.put(PaymentController());

  final selectedPayment = ''.obs;
  void updateSelectedPayment(String payment) {
    selectedPayment.value = payment;
  }

  // This function will be triggered when a step is tapped
  // stepTapped(int step) {
  //   currentStep.value = step;
  // }

  late int costPerHour;

  // This function will be called when the continue button is tapped
  // stepContinue(context) {
  //   calculateTotal(costPerHour);

  //   currentStep < 1 ? (currentStep.value += 1) : lastPage(context);
  // }

  // This function will be called when the cancel button is tapped
  // stepCancel() {
  //   currentStep > 0 ? (currentStep.value -= 1) : null;
  // }

  final duration = ''.obs;
  RxDouble totalAmount = 0.0.obs;
  calculateTotal(int cost) {
    duration.value = '';
    String startDateC =
        '${homeController.startDateController.text} ${homeController.sTController.text}';
    String endDateC =
        '${homeController.endDateController.text} ${homeController.eTController.text}';
    DateTime startDate = DateTime.parse(startDateC);

    DateTime endDate = DateTime.parse(endDateC);
    Duration difference = endDate.difference(startDate);
    if (difference.inMinutes < 60) {
      // Less than an hour
      String duration = '${difference.inMinutes} min';
      print(duration);
    } else {
      int days = difference.inDays;
      int hours = difference.inHours.remainder(24);
      int minutes = difference.inMinutes.remainder(60);
      if (days > 0) {
        duration.value += '$days day ';
      }
      if (hours > 0) {
        duration.value += '$hours hr ';
      }
      if (minutes > 0) {
        duration.value += '$minutes min';
      }
      log('-----duration------>>>>>>${duration.trim()}');
    }
    int hours = difference.inHours;
    int minutes = difference.inMinutes.remainder(60);
    double costPerHour = cost.toDouble();
    double decimalMinutes = minutes / 60.0;
    double totalHours = hours + decimalMinutes;
    double totalCost = totalHours * costPerHour;
    totalAmount.value = totalCost * 1;
  }

  final paymentMethod = 'cash'.obs;

  lastPage(context) {
    if (selectedPayment.value == "") {
      return CustomSnackBar.error(
          title: "Payment", message: "Choose payment method");
    }
    if (selectedPayment.value == "khalti") {
      payWithKhalti(context, totalAmount.value, "prouct", "khalti");
      paymentMethod.value = "khalti";
    } else {
      postOrder();
    }
  }

  String? payment;
  payWithKhalti(
      context, double amount, String productIdentity, String productName) {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: amount.toInt() * 100,
        productIdentity: productIdentity,
        productName: productName,
      ),
      preferences: [
        PaymentPreference.khalti,
      ],
      onSuccess: (success) {
        paymentController.token.value = success.token;
        paymentController.amount.value = success.amount;

        log("tnx id -----------${paymentController.token.toString()}");
        payment = paymentController.token.toString();
        paymentController.postPayment();
        postOrder();
        CustomSnackBar.success(title: "Payment", message: "Payment Successful");
      },
      onFailure: (fa) {
        CustomSnackBar.error(title: "Payment", message: "Payment Failure");
      },
      onCancel: () {
        CustomSnackBar.info(title: "Payment", message: "Payment Cancel");
      },
    );
  }

  RxInt vendorId = 0.obs;
  RxInt vehicleId = 0.obs;

  postOrder() async {
    loading.value = true;
    await OrderRepo.addOrder(
      // khaltiResponse: paymentSuccess,
      amount: paymentController.amount.value.toString(),
      tnxid: payment,
      startDate:
          '${homeController.startDateController.text} ${homeController.sTController.text}',
      endDate:
          '${homeController.endDateController.text} ${homeController.eTController.text}',
      paymentMethod: paymentMethod.value.toString(),
      vendorId: vendorId.value,
      vehicleId: vehicleId.value,
      orderTime: duration.value.toString(),
      quantity: 1,
      totalPrice: totalAmount.value.toInt(),
      onSuccess: () {
        CustomSnackBar.success(
            title: "Order Successful", message: "Order placed succesfully");
        Get.off(() => OrderConfirmPage());
      },
      onError: (message) {
        loading.value = false;
        CustomSnackBar.error(message: message, title: "Order");
      },
    );
  }
}
