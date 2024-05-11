import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/models/order.dart';
import 'package:rent_and_ride/widgets/custom_button.dart';
import 'package:rent_and_ride/widgets/custom_text_style.dart';

import '../../controllers/dashboard/history_controller.dart';
import '../../utils/colors.dart';

class ViewRecentSinglePage extends StatelessWidget {
  ViewRecentSinglePage({super.key, required this.recentOrderDetail});

  final Order recentOrderDetail;
  final c = Get.find<HistoryController>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
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
        child: Column(
          children: [
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
            //   width: double.infinity,
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: theme.colorScheme.tertiary,
            //     boxShadow: [
            //       BoxShadow(
            //         offset: const Offset(4, 4),
            //         blurRadius: 9,
            //         color: const Color(0xFF494949).withOpacity(0.1),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Summary",
            //         style: textTheme.titleLarge!
            //             .copyWith(color: theme.colorScheme.secondary),
            //       ),
            //       const SizedBox(
            //         height: 9,
            //       ),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           ClipRRect(
            //             borderRadius: (BorderRadius.circular(10)),
            //             child: Image.network(
            //               recentOrderDetail.vehicle!.imageUrl ?? "",
            //               fit: BoxFit.fill,
            //               height: 100,
            //               width: 100,
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 recentOrderDetail.vehicle!.vehicleName ?? "",
            //                 style: textTheme.titleLarge!.copyWith(
            //                     fontSize: 14, color: theme.colorScheme.secondary),
            //               ),
            //               const SizedBox(
            //                 height: 7,
            //               ),
            //               Text(
            //                 recentOrderDetail.vehicle!.brandName ?? "",
            //                 style: textTheme.bodyMedium!.copyWith(
            //                   fontSize: 12,
            //                   color: AppColors.secondaryColor,
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 7,
            //               ),
            //               Text(
            //                 "Lakeside, Pokhara",
            //                 style: textTheme.bodyMedium!.copyWith(
            //                   fontSize: 12,
            //                   color: AppColors.secondaryColor,
            //                 ),
            //               ),
            //               const SizedBox(
            //                 height: 7,
            //               ),
            //               Row(
            //                 children: [
            //                   const Icon(
            //                     Icons.calendar_month,
            //                     size: 12,
            //                     color: AppColors.secondaryColor,
            //                   ),
            //                   Text(
            //                     recentOrderDetail.startDate ?? "",
            //                     style: textTheme.bodyMedium!.copyWith(
            //                       fontSize: 12,
            //                       color: AppColors.secondaryColor,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(
            //                 height: 7,
            //               ),
            //               Row(
            //                 children: [
            //                   const Icon(Icons.calendar_month,
            //                       size: 12, color: Colors.grey),
            //                   Text(
            //                     recentOrderDetail.endDate ?? "",
            //                     style: textTheme.bodyMedium!.copyWith(
            //                       fontSize: 12,
            //                       color: AppColors.secondaryColor,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const SizedBox(
            //             height: 14,
            //           ),
            //           CalculationRow(
            //             textTheme: textTheme,
            //             theme: theme,
            //             title: 'Cost per hour',
            //             calculation:
            //                 recentOrderDetail.vehicle!.costPerHour.toString(),
            //           ),
            //           CalculationRow(
            //             textTheme: textTheme,
            //             theme: theme,
            //             title: 'Total Order Time',
            //             calculation: recentOrderDetail.orderTime.toString(),
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           Row(
            //             children: List.generate(
            //               150 ~/ 2,
            //               (index) => Expanded(
            //                 child: Container(
            //                   color: index % 2 == 0
            //                       ? Colors.transparent
            //                       : Colors.grey,
            //                   height: 1,
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 "Total",
            //                 style: textTheme.bodyLarge!.copyWith(
            //                   // color: AppColors.primaryColor
            //                   color: theme.colorScheme.secondary,
            //                 ),
            //               ),
            //               Text(
            //                 recentOrderDetail.totalPrice.toString(),
            //                 style: textTheme.bodyLarge!.copyWith(
            //                   // color: AppColors.primaryColor
            //                   color: theme.colorScheme.secondary,
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 25,
            //           ),
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //                 minimumSize: const Size(double.infinity, 50),
            //                 maximumSize: const Size(double.infinity, 60),
            //                 backgroundColor: AppColors.errorColor,
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(8),
            //                 )),
            //             onPressed: () {
            //               print(recentOrderDetail.id.toString());
            //               c.cancelBooking(recentOrderDetail.id!);
            //             },
            //             child: const Text("Cancel Booking"),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                    "Details",
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
                      imageUrl: recentOrderDetail.vehicle!.imageUrl!,
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
                        recentOrderDetail.vehicle!.vehicleName ?? "",
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
                        calculation:
                            recentOrderDetail.vendor!.shopAddress ?? "",
                        title: 'Shop Address',
                      ),
                      CalculationRow(
                        textTheme: textTheme,
                        theme: theme,
                        calculation: recentOrderDetail.startDate ?? "",
                        title: 'From',
                      ),
                      CalculationRow(
                        textTheme: textTheme,
                        theme: theme,
                        calculation: recentOrderDetail.endDate ?? "",
                        title: 'To',
                      ),
                      CalculationRow(
                        textTheme: textTheme,
                        theme: theme,
                        title: 'Cost per hour',
                        calculation:
                            recentOrderDetail.vehicle!.costPerHour.toString(),
                      ),
                      CalculationRow(
                        textTheme: textTheme,
                        theme: theme,
                        title: 'Total Order Time',
                        calculation: recentOrderDetail.orderTime.toString(),
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
                                'Rs ${recentOrderDetail.totalPrice.toString()}',
                                style: textTheme.bodyLarge!
                                    .copyWith(color: AppColors.primaryColor),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
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
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () {
              c.cancelBooking(recentOrderDetail.id!);
            },
            buttonText: 'Cancel Booking',
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
