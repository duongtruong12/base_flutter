import 'package:base_flutter/data/api/api_provider.dart';
import 'package:base_flutter/data/repositories/home_repository.dart';
import 'package:base_flutter/ui/screen/home/home_controller.dart';
import 'package:base_flutter/utils/const.dart';
import 'package:base_flutter/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(
    HomeController(
      repository: HomeRepository(apiProvider: ApiProvider()),
    ),
  );

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('you_have_press'.tr),
            Obx(() => Text(
                  '${controller.counter.value}',
                  style: TextStyleDefault.mainTextStyle,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        tooltip: 'increment'.tr,
        backgroundColor: Const.bgMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
