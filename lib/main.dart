import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'controllers/auth/core_controller.dart';
import 'controllers/dashboard/home_controller.dart';
import 'utils/page.dart';
import 'utils/theme.dart';
import 'views/splash_screen.dart';

void main() async {
  Get.put(HomePageController());
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_f18b878e02d64e10988f46aea7baa233",
      builder: (context, navigatorKey) {
        return GetBuilder<CoreController>(
            init: Get.put(CoreController()),
            builder: (c) {
              return GetMaterialApp(
                navigatorKey: navigatorKey,
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('ne', 'NP'),
                ],
                localizationsDelegates: const [
                  KhaltiLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Hamro Sadhan',
                theme: basicTheme(),
                darkTheme: darkTheme(),
                initialRoute: SplashScreen.routeName,
                themeMode: c.darkTheme.value ? ThemeMode.dark : ThemeMode.light,
                initialBinding: BindingsBuilder(() {
                  Get.put(CoreController());
                }),
                getPages: [...commonPages, ...userPages],
              );
            });
      },
    );
  }
}
