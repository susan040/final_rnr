import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/models/on_going_order.dart';

import '../../models/order.dart';
import '../../repo/recent_order_repo.dart';
import '../../widgets/custom_snackbar.dart';

class RecentOrderController extends GetxController {
  RxList<Order> recentOrderDetails = RxList();
  RxList<OnGoingOrder> onGoing = RxList();
  RxBool loading = false.obs;

  PageController pageController = PageController(keepPage: true);
  RxString selectedTab = RxString("active");
  Rx<PageStorageKey> pageKey =
      Rx<PageStorageKey>(const PageStorageKey("Orders"));

  RxnInt activeNextPage = RxnInt();
  RxnInt pastNextPage = RxnInt();

  RxBool isLoadingActive = RxBool(false);
  RxBool isLoadingPast = RxBool(false);

  final ScrollController activeScrollController = ScrollController();
  final ScrollController pastScrollController = ScrollController();

  late Timer timer;

  @override
  void onInit() {
    // timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    getAllRecentOrders();
    getOnGoingOrder();
    //   print(onGoing.length);
    // });

    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void changeTab(String tab) {
    if (tab == selectedTab.value) return;
    selectedTab.value = tab;
    if (selectedTab.value == "active") {
      pageController.animateToPage(0,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    } else {
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  getAllRecentOrders() async {
    recentOrderDetails.clear();
    loading.value = true;
    await RecentOrderRepo.getAllRecentOrder(
      onSuccess: (orders) {
        loading.value = false;
        recentOrderDetails.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }

  getOnGoingOrder() async {
    log("ongoing order");
    onGoing.clear();
    loading.value = true;
    await RecentOrderRepo.getOnGoing(
      onSuccess: (orders) {
        loading.value = false;
        onGoing.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }
}
