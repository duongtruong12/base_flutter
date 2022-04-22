import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api_provider.dart';
import '../../../data/repositories/default_repository.dart';
import '../../../utils/text_style.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(
    HomeController(
      repository: DefaultRepository(apiProvider: ApiProvider()),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
