import 'package:base_flutter/data/repositories/splash_repository.dart';
import 'package:base_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SplashRepository repository;
  RxInt counter = 0.obs;

  SplashController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    await Future<dynamic>.delayed(const Duration(seconds: 2))
        .then((value) => Get.offNamed(Routes.home));
  }
}
