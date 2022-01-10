import 'package:get/get.dart';
import 'package:logger/logger.dart';

String? idToken;
bool isMaintenance = false;
int tabIndex = 0;
RxBool loading = RxBool(false);
final logger = Logger(
    printer:
        PrettyPrinter(methodCount: 1, printTime: false, printEmojis: true));
