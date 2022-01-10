import 'package:base_flutter/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
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
