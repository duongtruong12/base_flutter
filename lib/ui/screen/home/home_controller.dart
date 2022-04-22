import 'package:get/get.dart';

import '../../../data/repositories/default_repository.dart';

class HomeController extends GetxController {
  final DefaultRepository repository;
  RxInt counter = 0.obs;

  HomeController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
  }

  void incrementCounter() {
    counter.value += 1;
  }
}
