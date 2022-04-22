import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/const.dart';
import '../../utils/text_style.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog(
      {Key? key,
      this.title,
      this.content,
      this.onPressedConfirm,
      this.onPressedCancel,
      this.confirmText,
      this.cancelText})
      : super(key: key);
  final String? title;
  final String? content;
  final String? cancelText;
  final String? confirmText;
  final GestureTapCallback? onPressedCancel;
  final GestureTapCallback? onPressedConfirm;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    title ?? '',
                    style: TextStyleDefault.blackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    content ?? '',
                    style: TextStyleDefault.hintTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Container(color: Const.borderColorDialog, height: 0.6),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        if (onPressedCancel != null) onPressedCancel!();
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            cancelText ?? 'cancel'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyleDefault.normalBlackTextStyleBold,
                          )),
                    ),
                  ),
                  Container(width: 0.6, color: Const.borderColorDialog),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.back();
                        if (onPressedConfirm != null) onPressedConfirm!();
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            confirmText ?? 'confirm'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyleDefault.normalErrorTextStyleBold,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
