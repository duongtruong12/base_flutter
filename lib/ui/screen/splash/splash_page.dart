import 'package:base_flutter/data/api/api_provider.dart';
import 'package:base_flutter/data/repositories/splash_repository.dart';
import 'package:base_flutter/ui/screen/splash/splash_controller.dart';
import 'package:base_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(
    SplashController(
      repository: SplashRepository(apiProvider: ApiProvider()),
    ),
  );

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Const.bgMenu,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
