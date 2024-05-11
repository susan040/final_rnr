import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/controllers/dashboard/history_controller.dart';
import 'package:rent_and_ride/utils/image_paths.dart';
import 'package:intl/intl.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../../models/order.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  static const routeName = "/statement";

  // final c = Get.find<HistoryController>();
  final c = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "History",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                c.filterHistory();
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : ((c.orderDetails.isEmpty)
                ? RefreshIndicator(
                    onRefresh: () async {
                      c.getAllOrders();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            ImagePath.noHistory,
                            height: 300,
                            width: 200,
                          ),
                        ),
                        const SizedBox(
                          height: 53,
                        ),
                        const Text(
                          "No History Available",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: c.orderDetails.length,
                      itemBuilder: (context, index) {
                        Order orders =
                            c.orderDetails[c.orderDetails.length - 1 - index];

                        bool isSameDay(String a, String b) {
                          DateTime dateA = DateTime.parse(a);
                          DateTime dateB = DateTime.parse(b);
                          return dateA.year == dateB.year &&
                              dateA.month == dateB.month &&
                              dateA.day == dateB.day;
                        }

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              if (index == 0 ||
                                  !isSameDay(
                                      orders.createdAt!,
                                      c
                                          .orderDetails[c.orderDetails.length -
                                              1 -
                                              index +
                                              1]
                                          .createdAt!))
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15, top: 25),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                width: double.infinity,
                                // height: 105,
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 8, vertical: 10),
                                margin: const EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.tertiary,

                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF828282)
                                          .withOpacity(0.06),
                                      blurRadius: 9,
                                      offset: const Offset(4, 4),
                                    )
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        fit: BoxFit.fill,
                                        width: 90,
                                        height: 80,
                                        imageUrl:
                                            orders.vehicle!.imageUrl ?? "",
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/logo.png',
                                          width: 90,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width / 1.7,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            "${orders.vehicle!.vehicleName} ${orders.vehicle!.vehicleNumber}",
                                            style:
                                                textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          Text(
                                            orders.vendor!.name ?? "",
                                            style:
                                                textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  theme.colorScheme.secondary,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                DateFormat('MMMM d EEEE, y')
                                                    .format(DateTime.parse(
                                                        orders.createdAt!)),
                                                style:
                                                    CustomTextStyles.f10W400(),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 4,
                                          ),

                                          // const SizedBox(
                                          //   height: 5,
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: orders.status ==
                                                          'completed'
                                                      ? const Color.fromARGB(
                                                          255, 34, 123, 37)
                                                      : (orders.status ==
                                                              'cancel'
                                                          ? const Color
                                                              .fromARGB(
                                                              255, 150, 37, 29)
                                                          : Colors.amber),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Text(
                                                  orders.status!.capitalize ??
                                                      "",
                                                  style: textTheme.bodyLarge!
                                                      .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
                                                child: Text(
                                                  'Rs ${orders.totalPrice}',
                                                  style: textTheme.bodyLarge!
                                                      .copyWith(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: theme
                                                        .colorScheme.primary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 11)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
      ),
    );
  }
}
