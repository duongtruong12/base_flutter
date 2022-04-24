import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../data/repositories/default_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/global/globals_functions.dart';
import '../../../utils/text_style.dart';

class IntroductionController extends GetxController {
  final DefaultRepository repository;

  IntroductionController({required this.repository});

  final introController = GlobalKey<IntroductionScreenState>();
  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyleDefault.introductionTitleStyle,
    bodyTextStyle: TextStyleDefault.normalBlackTextStyle,
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
  );
  final listPage = <PageViewModel>[];
  Rx<int?> currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    listPage.addAll(<PageViewModel>[
      PageViewModel(
        title: 'introduction_1'.tr,
        body: 'introduction_content_1'.tr,
        image: getPngImage('ic_introduction_1', height: 165),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'introduction_2'.tr,
        body: 'introduction_content_2'.tr,
        image: getPngImage('ic_introduction_2', height: 180),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'introduction_3'.tr,
        body: 'introduction_content_3'.tr,
        image: getPngImage('ic_introduction_3', height: 232),
        decoration: pageDecoration,
      ),
    ]);
  }

  void onNext() {
    final page = currentPage.value ?? 0;
    if (page + 1 != listPage.length) {
      introController.currentState?.animateScroll(page + 1);
    } else {
      onSkip();
    }
  }

  bool isNotFinalPage() {
    final page = currentPage.value ?? 0;
    if (page + 1 != listPage.length) {
      return true;
    } else {
      return false;
    }
  }

  void onPageChange(int? i) {
    currentPage.value = i;
  }

  void onSkip() {
    Get.offNamed(Routes.home);
  }
}
