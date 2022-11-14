import 'package:base_flutter/ui/screen/splash/splash_controller.dart';
import 'package:base_flutter/utils/global/globals_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(
    SplashController(
      repository: DefaultRepository(apiProvider: ApiProvider()),
    ),
  );

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBarColor();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getLottieImage('splash_lottie'),
            getLottieImage('loading', height: 150),
          ],
        ),
      ),
    );
  }
}
