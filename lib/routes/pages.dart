import 'package:flutter_template/routes/routes.dart';
import 'package:get/get.dart';

import '../view/screens/internet_screen.dart';
import '../view/screens/splash_screen.dart';

class Pages {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: Routes.internetScreen,
        page: () => const InternetScreen(),
      ),
    ];
  }
}
