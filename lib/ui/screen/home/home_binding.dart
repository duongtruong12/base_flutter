import 'package:base_flutter/data/api/api_provider.dart';
import 'package:base_flutter/data/repositories/home_repository.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiProvider: ApiProvider()),
      ),
    );
  }
}
