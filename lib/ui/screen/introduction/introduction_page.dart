import 'package:base_flutter/utils/global/globals_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';
import '../../../utils/const.dart';
import '../../../utils/text_style.dart';
import '../../custom_view/custom_button.dart';
import 'introduction_controller.dart';

class IntroductionPage extends StatelessWidget {
  final controller = Get.put(
    IntroductionController(
      repository: DefaultRepository(apiProvider: ApiProvider()),
    ),
  );

  IntroductionPage({Key? key}) : super(key: key);

  Widget _buildNextButton() {
    return Obx(
      () => Column(
        children: [
          CustomButtonRounded(
              height: 58,
              onPressed: controller.isNotFinalPage()
                  ? controller.onNext
                  : controller.onSkip,
              widget: Text(
                  controller.isNotFinalPage() ? 'next'.tr : 'start_now'.tr)),
          const SizedBox(height: 8),
          CustomButtonRounded(
            color: Colors.white,
            borderColor: Colors.white,
            onPressed: controller.isNotFinalPage() ? controller.onSkip : () {},
            widget: Text(
              'skip'.tr,
              style: controller.isNotFinalPage()
                  ? TextStyleDefault.mediumMainTextStyle
                  : const TextStyle(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor();
    return SafeArea(
      child: IntroductionScreen(
        key: controller.introController,
        globalBackgroundColor: Colors.white,
        onChange: controller.onPageChange,
        globalFooter: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildNextButton(),
        ),
        showDoneButton: false,
        showNextButton: false,
        pages: controller.listPage,
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Const.deleteGreyColor,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
