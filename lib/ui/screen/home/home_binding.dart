import 'package:get/get.dart';

import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: DefaultRepository(apiProvider: ApiProvider()),
      ),
    );
  }
}
