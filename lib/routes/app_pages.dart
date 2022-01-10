import 'package:base_flutter/ui/screen/home/home_binding.dart';
import 'package:base_flutter/ui/screen/home/home_page.dart';
import 'package:base_flutter/ui/screen/splash/splash_binding.dart';
import 'package:base_flutter/ui/screen/splash/splash_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
