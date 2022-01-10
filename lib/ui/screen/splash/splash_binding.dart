import 'package:base_flutter/data/api/api_provider.dart';
import 'package:base_flutter/data/repositories/splash_repository.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        repository: SplashRepository(apiProvider: ApiProvider()),
      ),
    );
  }
}
