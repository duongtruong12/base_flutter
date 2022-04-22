import 'package:get/get.dart';

import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';
import 'splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        repository: DefaultRepository(apiProvider: ApiProvider()),
      ),
    );
  }
}
