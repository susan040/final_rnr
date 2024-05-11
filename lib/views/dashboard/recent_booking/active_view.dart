import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../../../controllers/dashboard/recent_controller.dart';
import '../../../models/order.dart';
import '../../../widgets/custom_button.dart';
import '../recent_booking_view_page.dart';

class UpCommingBooking extends StatelessWidget {
  final c = Get.find<RecentOrderController>();
  UpCommingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Obx(() {
      if (c.isLoadingActive.value) {
        return SizedBox(
          height: Get.height / 2,
          child: const Center(
            child: LinearProgressIndicator(),
          ),
        );
      } else if (!c.isLoadingActive.value && c.recentOrderDetails.isEmpty) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "No Recent Bookings",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        );
      } else {
        return ListView.builder(
          itemCount: c.recentOrderDetails.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Order recentOrders = c.recentOrderDetails[index];
            return InkWell(
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                padding:
                    const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                width: double.infinity,
                height: 109,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4, 4),
                      blurRadius: 9,
                      color: const Color(0xFF494949).withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            fit: BoxFit.fill,
                            height: 90,
                            width: 90,
                            imageUrl: recentOrders.vehicle!.imageUrl!,
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/logo.png',
                              height: 60,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recentOrders.vehicle!.vehicleName!,
                              style: CustomTextStyles.f14W600(),
                            ),
                            // const SizedBox(
                            //   height: 2,
                            // ),
                            // Text(
                            //   "${recentOrders.vehicle!.brandName!} ${recentOrders.vehicle!.color!}",
                            //   style: CustomTextStyles.f12W400(),
                            // ),
                            const SizedBox(
                              height: 2,
                            ),
                            // Text(
                            //   recentOrders.vehicle!.vehicleNumber!,
                            //   style: CustomTextStyles.f12W400(),
                            // ),
                            Row(
                              children: [
                                Text(
                                  "From: ",
                                  style: CustomTextStyles.f10W400(),
                                ),
                                Text(
                                  DateFormat('MMMM d EEEE').format(
                                      DateTime.parse(recentOrders.startDate!)),
                                  style: CustomTextStyles.f10W400(),
                                ),
                                Text(
                                  ' ${DateFormat.jms().format(DateTime.parse(recentOrders.startDate!))}',
                                  style: CustomTextStyles.f10W400(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Text(
                                  "To: ",
                                  style: CustomTextStyles.f10W400(),
                                ),
                                Text(
                                  DateFormat('MMMM d EEEE').format(
                                      DateTime.parse(recentOrders.endDate!)),
                                  style: CustomTextStyles.f10W400(),
                                ),
                                Text(
                                  ' ${DateFormat.jms().format(DateTime.parse(recentOrders.endDate!))}',
                                  style: CustomTextStyles.f10W400(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              height: 35,
                              width: Get.width / 1.8,
                              child: CustomElevatedButton(
                                onTap: () {
                                  Get.to(() => ViewRecentSinglePage(
                                        recentOrderDetail: recentOrders,
                                      ));
                                },
                                buttonText: 'View',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
