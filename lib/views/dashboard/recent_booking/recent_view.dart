import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/views/dashboard/recent_booking/active_view.dart';

import '../../../controllers/dashboard/recent_controller.dart';

class RecentViewPage extends StatelessWidget {
  final c = Get.put(RecentOrderController());
  RecentViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recents",
            style: theme.textTheme.bodyLarge!
                .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
          ),
        ),
        centerTitle: false,
      ),
      body: UpCommingBooking(),
    );
  }
}
