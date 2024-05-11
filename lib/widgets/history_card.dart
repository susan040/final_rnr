import 'package:flutter/material.dart';

import '../models/order.dart';
import '../utils/colors.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.showDate,
    required this.order,
  }) : super(key: key);

  final bool showDate;
  final Order order;

  @override
  Widget build(BuildContext context) {

    bool isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

String formatDate(DateTime date) =>
    '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}';
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return 
    Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: 
      Column(
        children: [
    
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    order.startDate.toString(),
                    style: textTheme.bodySmall!.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Container(
                    height: 1.5,
                    color: const Color.fromRGBO(239, 239, 239, 1),
                  ))
                ],
              ),
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF828282).withOpacity(0.06),
                  blurRadius: 9,
                  offset: const Offset(4, 4),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.vendor!.name ?? "",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(
                      197,
                      197,
                      197,
                      1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  order.vehicle!.vehicleDescription ?? "",
                  style: textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
                Text(
                  order.vehicle!.vehicleName ?? "",
                  style: textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
