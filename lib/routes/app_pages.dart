import 'package:get/get.dart';

import '../ui/screen/home/home_binding.dart';
import '../ui/screen/home/home_page.dart';
import '../ui/screen/introduction/introduction_binding.dart';
import '../ui/screen/introduction/introduction_page.dart';
import '../ui/screen/splash/splash_binding.dart';
import '../ui/screen/splash/splash_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.introduction,
      page: () => IntroductionPage(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
