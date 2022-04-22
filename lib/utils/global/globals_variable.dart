import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

bool isMaintenance = false;
RxBool loading = RxBool(false);
String? email;
String? password;
dynamic data;
final picker = ImagePicker();
final logger = Logger(
    printer:
        PrettyPrinter(methodCount: 1, printTime: false, printEmojis: true));
