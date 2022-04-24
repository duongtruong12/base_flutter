import 'package:get/get.dart';

import '../../../data/repositories/default_repository.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final DefaultRepository repository;

  SplashController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    await Future<dynamic>.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamed(Routes.introduction));
  }
}
