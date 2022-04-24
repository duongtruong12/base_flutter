import 'package:base_flutter/ui/screen/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';
import '../../../utils/global/globals_functions.dart';

class SplashPage extends StatelessWidget {
  final controller = Get.put(
    SplashController(
      repository: DefaultRepository(apiProvider: ApiProvider()),
    ),
  );

  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return Container(
      color: Colors.white,
      child: Center(
        child: getPngImage('ic_logo', height: 101, width: 205),
      ),
    );
  }
}
