import 'dart:io' show Platform, exit;

import 'package:base_flutter/data/api/api_provider.dart';
import 'package:base_flutter/lang/locale_service.dart';
import 'package:base_flutter/routes/app_pages.dart';
import 'package:base_flutter/ui/custom_view/custom_dialog.dart';
import 'package:base_flutter/utils/connect_internet_check.dart';
import 'package:base_flutter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

String _launchedAndroidUrl =
    "https://play.google.com/store/apps/details?id=resonant.com.ticketpass";
String _launchIosUrl =
    "https://apps.apple.com/us/app/resonant-ticket-pass/id1570751399";

var connectivity = ConnectivityChangeNotifier();

Future<void> _launchInBrowser() async {
  final String _launchedUrl =
      Platform.isIOS ? _launchIosUrl : _launchedAndroidUrl;

  if (await canLaunch(_launchedUrl)) {
    await launch(
      _launchedUrl,
      forceSafariVC: false,
      forceWebView: false,
      universalLinksOnly: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $_launchedUrl';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check version application
  // var checkInternet = await connectivity.checkConnectivity();
  // final String appVersion = await getVersionInformation();
  //
  // if (checkInternet) {
  //   checkVersion(
  //       onSuccess: (res) {
  //         runApp(const MyApp());
  //       },
  //       onError: (error) async {
  //         runApp(ScreenUtilInit(
  //             designSize: const Size(375, 904),
  //             builder: () => const MaterialApp(home: VersionUpdateConfirm())));
  //       },
  //       appVersion: appVersion);
  // } else {
  //   runApp(const MyApp());
  // }

  runApp(const MyApp());
}

void checkVersion(
    {required Function(dynamic listFaq) onSuccess,
    required Function(dynamic error) onError,
    appVersion}) async {
  final ApiProvider provider = ApiProvider();
  try {
    final res = await provider.checkVersion({"appVersion": appVersion});
    onSuccess(res["data"]);
  } catch (e) {
    onError(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 904),
      builder: () => GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Const.materialColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        locale: LocalizationService.locale,
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: LocalizationService(),
        initialRoute: Routes.splash,
        getPages: AppPages.pages,
      ),
    );
  }
}

class VersionUpdateConfirm extends StatelessWidget {
  const VersionUpdateConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomDialog(
          content: Text(
            "updateVersion".tr,
            textAlign: TextAlign.center,
          ),
          actionConfirm: () async {
            await _launchInBrowser();
            await Future.delayed(const Duration(seconds: 500));
            exit(0);
          },
          confirmLabel: "confirm".tr,
        ),
      ),
    );
  }
}
