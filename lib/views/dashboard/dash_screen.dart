import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_and_ride/views/dashboard/history_page.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../controllers/dashboard/dash_screen_controller.dart';
import '../../utils/colors.dart';
import 'recent_booking/recent_view.dart';
import 'home_page.dart';
import 'profile_page.dart';

class DashScreen extends StatefulWidget {
  static const routeName = '/dash-screen';

  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // getConnectivity();
    super.initState();
  }

  // getConnectivity() =>
  //     subscription = Connectivity().onConnectivityChanged.listen(
  //       (ConnectivityResult result) async {
  //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //         if (!isDeviceConnected && isAlertSet == false) {
  //           showDialogBox();
  //           setState(() => isAlertSet = true);
  //         }
  //       },
  //     );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  final c = Get.put(DashScreenController());

  @override
  Widget build(BuildContext context) {
    final pages = [
      Homepage(),
      RecentViewPage(),
      HistoryPage(),
      ProfilePage(),
    ];
    return Scaffold(
      // appBar:
      body: Obx(() => pages[c.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          selectedIndex: c.currentIndex.value,
          onItemSelected: c.onItemTapped,
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                textAlign: TextAlign.center,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
                icon: const Icon(Icons.receipt_long_outlined),
                title: const Text("Recents"),
                textAlign: TextAlign.center,
                activeColor: AppColors.primaryColor,
                inactiveColor: Colors.grey),
            BottomNavyBarItem(
              icon: const Icon(Icons.history),
              title: const Text("History"),
              textAlign: TextAlign.center,
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              textAlign: TextAlign.center,
              activeColor: AppColors.primaryColor,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet \n connection'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
