import 'package:base_flutter/utils/const.dart';
import 'package:base_flutter/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final Widget content;
  final Function? actionCancel;
  final Function actionConfirm;
  final String? confirmLabel;
  final String? cancelLabel;
  final bool reverse;

  const CustomDialog(
      {Key? key,
      required this.content,
      this.actionCancel,
      required this.actionConfirm,
      this.confirmLabel,
      this.reverse = false,
      this.cancelLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildCancelButton() {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: Const.resizeVer(11)),
          child: GestureDetector(
              child: Container(
                  padding: EdgeInsets.fromLTRB(
                      0, Const.resizeHoz(18), 0, Const.resizeHoz(18)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Const.resizeHoz(12))),
                    border: Border.all(
                        color: Const.borderColorDialog,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  child: Center(
                    child: Text(
                      cancelLabel ?? 'cancel'.tr,
                      style: TextStyleDefault.buttonTextStyle,
                    ),
                  )),
              onTap: () {
                if (actionCancel != null) actionCancel!();
              }),
        ),
      );
    }

    Widget _buildConfirmButton() {
      return Expanded(
        child: GestureDetector(
          child: Container(
              padding: EdgeInsets.fromLTRB(
                  0, Const.resizeHoz(18), 0, Const.resizeHoz(18)),
              decoration: BoxDecoration(
                color: Const.activeMenuColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(Const.resizeHoz(12))),
                border: Border.all(
                    color: Const.borderColorDialog,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              child: Center(
                child: Text(
                  confirmLabel ?? 'confirm'.tr,
                  style: TextStyleDefault.buttonTextStyle,
                ),
              )),
          onTap: () {
            actionConfirm();
          },
        ),
      );
    }

    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: Const.resizeHoz(28)),
      contentPadding: EdgeInsets.fromLTRB(
          Const.resizeHoz(28), Const.resizeHoz(28), Const.resizeHoz(28), 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Const.resizeHoz(27)))),
      content: Wrap(children: [
        Center(child: content),
      ]),
      actions: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 35.h, bottom: 18.h, right: 18.w, left: 18.w),
          width: Get.width,
          child: GestureDetector(
            child: !reverse
                ? Row(
                    children: [
                      _buildConfirmButton(),
                      actionCancel != null
                          ? _buildCancelButton()
                          : const SizedBox()
                    ],
                  )
                : Row(
                    children: [
                      actionCancel != null
                          ? _buildCancelButton()
                          : const SizedBox(),
                      _buildConfirmButton(),
                    ],
                  ),
            onTap: () {
              Get.back(result: true);
            },
          ),
        ),
      ],
    );
  }
}
