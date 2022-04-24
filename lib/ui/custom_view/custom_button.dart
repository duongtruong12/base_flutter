import 'package:flutter/material.dart';

import '../../utils/const.dart';
import '../../utils/text_style.dart';

class CustomButtonRounded extends StatelessWidget {
  const CustomButtonRounded(
      {Key? key,
      required this.onPressed(),
      required this.widget,
      this.color,
      this.width,
      this.height,
      this.borderColor,
      this.textColor})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget widget;
  final double? width;
  final double? height;

  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Inter',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle?>(
                TextStyleDefault.mediumWhiteTextStyle),
          ),
        ),
      ),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 45,
        child: ElevatedButton(
          child: widget,
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor:
                MaterialStateProperty.all<Color?>(color ?? Const.mainColor),
            foregroundColor:
                MaterialStateProperty.all<Color?>(textColor ?? Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(
                  color: borderColor != null ? borderColor! : Const.mainColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonFlat extends StatelessWidget {
  const CustomButtonFlat(
      {Key? key,
      required this.onPressed,
      required this.widget,
      this.color,
      this.width,
      this.height,
      this.borderRadius,
      this.borderColor,
      this.padding,
      this.elevation,
      this.textColor})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget widget;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? elevation;

  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Inter',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle?>(
                TextStyleDefault.mediumWhiteTextStyle),
          ),
        ),
      ),
      child: TextButton(
        key: key,
        child: widget,
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(padding),
          elevation: MaterialStateProperty.all<double>(elevation ?? 0),
          backgroundColor:
              MaterialStateProperty.all<Color?>(color ?? Const.mainColor),
          foregroundColor:
              MaterialStateProperty.all<Color?>(textColor ?? Colors.white),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius != null ? borderRadius! : 40),
                side: BorderSide(
                  color: borderColor != null ? borderColor! : Const.mainColor,
                )),
          ),
        ),
      ),
    );
  }
}

class CustomButtonIcon extends StatelessWidget {
  const CustomButtonIcon(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.height,
      this.width,
      this.color,
      this.borderColor,
      this.textColor})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Widget icon;
  final double? width;
  final double? height;

  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'Inter',
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle?>(
                TextStyleDefault.mediumWhiteTextStyle),
          ),
        ),
      ),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 45,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            backgroundColor:
                MaterialStateProperty.all<Color?>(color ?? Colors.white),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                side: BorderSide(
                  color: borderColor != null ? borderColor! : Const.mainColor,
                ),
              ),
            ),
          ),
          label:
              Text(text, style: TextStyle(color: textColor ?? Const.mainColor)),
          icon: icon,
        ),
      ),
    );
  }
}

class CustomListTileButton extends StatelessWidget {
  const CustomListTileButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.leading,
      this.color,
      this.height = 52,
      this.trailing})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget title;
  final Widget? leading;
  final Widget? trailing;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        color: color,
        child: ListTile(
          onTap: onPressed,
          title: title,
          leading: leading,
          trailing: trailing,
        ),
      ),
    );
  }
}
