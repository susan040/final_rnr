import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/recent_controller.dart';
import 'package:rent_and_ride/models/order.dart';
import 'package:rent_and_ride/repo/order_repo.dart';
import 'package:rent_and_ride/utils/colors.dart';
import 'package:rent_and_ride/widgets/custom_snackbar.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../utils/image_paths.dart';
import '../../widgets/custom_button.dart';

class HistoryController extends GetxController {
  RxList<Order> orderDetails = RxList();
  RxBool loading = false.obs;

  final cancelLoading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final recentController = Get.find<RecentOrderController>();
  @override
  void onInit() {
    getAllOrders();
    super.onInit();
  }

  getAllOrders() async {
    loading.value = true;

    await OrderRepo.getAllOrders(
      orderType: "All",
      dateFilter: "Any",
      onSuccess: (orders) {
        orderDetails.clear();
        loading.value = false;
        orderDetails.addAll(orders);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Order", message: message);
      }),
    );
  }

  void cancelBooking(int id) async {
    cancelLoading.show(message: "Please wait");

    await OrderRepo.cancelBooking(
      orderId: id.toString(),
      onSuccess: (message) {
        cancelLoading.hide();
        Get.back();
        CustomSnackBar.success(title: "Booking", message: message);
        orderDetails.clear();
        getAllOrders();
        recentController.getAllRecentOrders();
        recentController.getOnGoingOrder();
      },
      onError: (message) {
        cancelLoading.hide();
        CustomSnackBar.error(title: "Booking", message: message);
      },
    );
  }

  final selectedOptionDate = 'Any'.obs;
  final selectedOptionStatus = 'All'.obs;
  filterHistory() {
    showModalBottomSheet(
      backgroundColor: AppColors.backGroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45.0),
        ),
      ),
      isScrollControlled: true,
      context: Get.context!,
      builder: ((context) {
        // final theme =
        //     Theme.of(context).copyWith(dividerColor: Colors.transparent);
        return Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 5,
                    width: 105,
                    decoration: BoxDecoration(
                      color: AppColors.borderColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(ImagePath.cancel)),
                      const Text(
                        "Filter By",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ExpandablePanel(
                        header: const ListTile(
                          title: Text(
                            'Order Status',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Column(
                          children: [
                            CheckboxListTile(
                              activeColor: AppColors.primaryColor,
                              title: const Text('Completed'),
                              value: selectedOptionStatus.value == 'completed',
                              onChanged: (bool? value) {
                                selectedOptionStatus.value =
                                    value == true ? 'completed' : 'All';
                              },
                            ),
                            CheckboxListTile(
                              activeColor: AppColors.primaryColor,
                              title: const Text('Active'),
                              value: selectedOptionStatus.value == 'active',
                              onChanged: (bool? value) {
                                selectedOptionStatus.value =
                                    value == true ? 'active' : 'All';
                              },
                            ),
                            CheckboxListTile(
                              activeColor: AppColors.primaryColor,
                              title: const Text('Cancel'),
                              value: selectedOptionStatus.value == 'cancel',
                              onChanged: (bool? value) {
                                selectedOptionStatus.value =
                                    value == true ? 'cancel' : 'All';
                              },
                            ),
                            CheckboxListTile(
                              title: const Text('All'),
                              activeColor: AppColors.primaryColor,
                              value: selectedOptionStatus.value == 'All',
                              onChanged: (bool? value) {
                                selectedOptionStatus.value = 'All';
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedButton(
                        onTap: () {
                          OrderRepo.getAllOrders(
                            orderType: selectedOptionStatus.value,
                            dateFilter: selectedOptionDate.value,
                            onSuccess: (orders) {
                              orderDetails.clear();
                              loading.value = false;
                              orderDetails.addAll(orders);
                            },
                            onError: ((message) {
                              loading.value = false;
                              CustomSnackBar.error(
                                  title: "Order", message: message);
                            }),
                          );
                          Navigator.pop(context);
                        },
                        buttonText: "Done",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
