import 'package:get/get.dart';

import '../ui/screen/home/home_binding.dart';
import '../ui/screen/home/home_page.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
