import 'package:base_flutter/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/const.dart';

class CustomView {
  static PreferredSizeWidget appbarCustom(
      {Widget? title,
      Widget? leading,
      Color? backgroundColor = Colors.white,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      bool flexibleSpace = false,
      bool isDark = false,
      bool automaticallyImplyLeading = true,
      PreferredSizeWidget? bottom,
      double? elevation}) {
    return AppBar(
        title: title,
        actions: actions,
        iconTheme: iconTheme,
        bottom: bottom,
        leading: leading,
        leadingWidth: leading != null ? 100 : null,
        titleTextStyle: TextStyleDefault.mediumBlackTextStyleBold,
        centerTitle: true,
        flexibleSpace: flexibleSpace
            ? Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/bg_appbar.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(color: Const.mainColor.withOpacity(0.7)),
                ],
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
            statusBarIconBrightness:
                isDark ? Brightness.dark : Brightness.light),
        backgroundColor: backgroundColor,
        elevation: elevation);
  }

  static Widget buildDivider() {
    return const Divider(color: Const.borderDefaultColor, height: 1);
  }

  static Widget buildVerticalDivider() {
    return const VerticalDivider(color: Const.borderDefaultColor, width: 1);
  }
}
