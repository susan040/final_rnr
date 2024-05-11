import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/models/on_going_order.dart';

import '../../controllers/dashboard/history_controller.dart';
import '../../utils/colors.dart';

class OnGoingSinglePage extends StatelessWidget {
  OnGoingSinglePage({super.key, required this.recentOrderDetail});

  final OnGoingOrder recentOrderDetail;
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 23),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: (BorderRadius.circular(10)),
                      child: Image.network(
                        recentOrderDetail.vehicle!.imageUrl ?? "",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recentOrderDetail.vehicle!.vehicleName ?? "",
                          style: textTheme.titleLarge!.copyWith(
                              fontSize: 14, color: theme.colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          recentOrderDetail.vehicle!.brandName ?? "",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Lakeside, Pokhara",
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 12,
                              color: AppColors.secondaryColor,
                            ),
                            Text(
                              recentOrderDetail.startDate ?? "",
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.calendar_month,
                                size: 12, color: Colors.grey),
                            Text(
                              recentOrderDetail.endDate ?? "",
                              style: textTheme.bodyMedium!.copyWith(
                                fontSize: 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 14,
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
                      title: 'Time',
                      calculation: recentOrderDetail.orderTime.toString(),
                    ),

                    const SizedBox(
                      height: 10,
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
                          style: textTheme.bodyLarge!.copyWith(
                            // color: AppColors.primaryColor
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        Text(
                          recentOrderDetail.totalPrice.toString(),
                          style: textTheme.bodyLarge!.copyWith(
                            // color: AppColors.primaryColor
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // ElevatedButton(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF1F1F1),
            ),
            child: const Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    'Please note that you cannot cancel your booking.',
                    maxLines: 3,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
