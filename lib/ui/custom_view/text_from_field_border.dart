import 'package:flutter/material.dart';

import '../../utils/border_style.dart';
import '../../utils/const.dart';
import '../../utils/global/globals_functions.dart';
import '../../utils/text_style.dart';

class TextFormFieldCustomBorder extends StatefulWidget {
  final TextEditingController textEditingController;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool obscureText;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;
  final bool showIconOnValidate;

  const TextFormFieldCustomBorder(
      {Key? key,
      required this.textEditingController,
      this.leftIcon,
      this.hintText,
      this.hintStyle,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.showIconOnValidate = false,
      this.keyboardType,
      this.maxLines = 1,
      this.minLines,
      this.errorMaxLines = 1,
      this.rightIcon})
      : super(key: key);

  @override
  _TextFormFieldCustomBorderState createState() =>
      _TextFormFieldCustomBorderState();
}

class _TextFormFieldCustomBorderState extends State<TextFormFieldCustomBorder>
    with SingleTickerProviderStateMixin {
  final focusNode = FocusNode();
  bool isFocus = false;
  bool isShowIconValidate = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isFocus = true;
      } else {
        isFocus = false;
      }
      if (mounted) setState(() {});
    });
  }

  Widget _buildRightIcon() {
    Widget content = const SizedBox();
    if (isShowIconValidate) {
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          getSvgImage('ic_validate_success'),
          SizedBox(width: setWidth(16)),
        ],
      );
    } else if (widget.rightIcon != null) {
      content = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.rightIcon!,
          SizedBox(width: setWidth(16)),
        ],
      );
    }
    return content;
  }

  Widget _buildLeftIcon() {
    return widget.leftIcon != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: setWidth(16)),
              widget.leftIcon!,
              SizedBox(width: setWidth(16)),
            ],
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    double minRight = widget.rightIcon != null ? 24 : 16.0;
    double minLeft = widget.leftIcon != null ? 24 : 16.0;

    return TextFormField(
      controller: widget.textEditingController,
      style: const TextStyle(fontSize: 14, color: Const.textColor),
      obscureText: widget.obscureText,
      validator: widget.validator,
      onChanged: (str) {
        if (widget.showIconOnValidate && widget.validator != null) {
          if (widget.validator!(str) == null) {
            isShowIconValidate = true;
          } else {
            isShowIconValidate = false;
          }
          if (mounted) setState(() {});
        }
        if (widget.onChanged != null) widget.onChanged!(str);
      },
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      focusNode: focusNode,
      decoration: InputDecoration(
          fillColor: isFocus ? Colors.white : Const.disableColor,
          filled: true,
          errorMaxLines: widget.errorMaxLines,
          border: defaultBorderStyle,
          enabledBorder: defaultBorderStyle,
          errorBorder: errorBorderStyle,
          focusedBorder: focusedBorderStyle,
          focusedErrorBorder: errorBorderStyle,
          errorStyle: TextStyleDefault.normalErrorTextStyle,
          suffixIconConstraints:
              BoxConstraints(minHeight: minRight, minWidth: minRight),
          prefixIconConstraints:
              BoxConstraints(minHeight: minLeft, minWidth: minLeft),
          suffixIcon: _buildRightIcon(),
          prefixIcon: _buildLeftIcon(),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? TextStyleDefault.hintTextStyle),
    );
  }
}

class TextFormFieldBorderLabel extends StatefulWidget {
  final TextEditingController textEditingController;
  final Widget? leftIcon;
  final Widget? leftActiveIcon;
  final Widget? rightIcon;
  final Widget? rightActiveIcon;
  final Color backgroundColor;
  final String? hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final bool obscureText;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;
  final bool showIconOnValidate;

  const TextFormFieldBorderLabel(
      {Key? key,
      required this.textEditingController,
      required this.labelText,
      this.backgroundColor = Colors.white,
      this.leftIcon,
      this.leftActiveIcon,
      this.rightActiveIcon,
      this.hintText,
      this.hintStyle,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.enabled = true,
      this.showIconOnValidate = false,
      this.keyboardType,
      this.maxLines = 1,
      this.minLines,
      this.errorMaxLines = 1,
      this.rightIcon})
      : super(key: key);

  @override
  _TextFormFieldBorderLabelState createState() =>
      _TextFormFieldBorderLabelState();
}

class _TextFormFieldBorderLabelState extends State<TextFormFieldBorderLabel>
    with SingleTickerProviderStateMixin {
  final focusNode = FocusNode();
  bool isFocus = false;
  bool isShowIconValidate = false;
  String errorText = '';
  Color _decorationColor = Const.borderDefaultColor;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      _changeColorDecoration();
    });
  }

  void _changeColorDecoration() {
    if (errorText.isEmpty) {
      if (focusNode.hasFocus) {
        isFocus = true;
        _decorationColor = Const.mainColor;
      } else {
        isFocus = false;
        _decorationColor = Const.borderDefaultColor;
      }
    } else {
      _decorationColor = Const.errorColor;
    }
    if (mounted) setState(() {});
  }

  Widget _buildRightIcon() {
    return widget.rightIcon != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: setWidth(16)),
              isFocus && widget.rightActiveIcon != null
                  ? widget.rightActiveIcon!
                  : widget.rightIcon!,
              SizedBox(width: setWidth(16)),
            ],
          )
        : const SizedBox();
  }

  Widget _buildLeftIcon() {
    return widget.leftIcon != null
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: setWidth(16)),
              isFocus && widget.leftActiveIcon != null
                  ? widget.leftActiveIcon!
                  : widget.leftIcon!,
              SizedBox(width: setWidth(16)),
            ],
          )
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    double minRight = widget.rightIcon != null ? 24 : 16.0;
    double minLeft = widget.leftIcon != null ? 24 : 16.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(color: _decorationColor, width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextFormField(
            controller: widget.textEditingController,
            style: TextStyleDefault.smallBlackBoldTextStyle,
            obscureText: widget.obscureText,
            validator: (str) {
              if (widget.validator != null) {
                String? error = widget.validator!(str);
                errorText = '';
                if (error != null) {
                  errorText = error;
                }
                _changeColorDecoration();
                return error;
              } else {
                return null;
              }
            },
            onChanged: (str) {
              if (widget.showIconOnValidate && widget.validator != null) {
                if (widget.validator!(str) == null) {
                  isShowIconValidate = true;
                } else {
                  isShowIconValidate = false;
                }
                if (mounted) setState(() {});
              }
              if (widget.onChanged != null) widget.onChanged!(str);
            },
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            focusNode: focusNode,
            decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: TextStyleDefault.normalBlackTextStyle,
                errorMaxLines: widget.errorMaxLines,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorStyle:
                    const TextStyle(height: 0, color: Colors.transparent),
                suffixIconConstraints:
                    BoxConstraints(minHeight: minRight, minWidth: minRight),
                prefixIconConstraints:
                    BoxConstraints(minHeight: minLeft, minWidth: minLeft),
                suffixIcon: _buildRightIcon(),
                prefixIcon: _buildLeftIcon(),
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? TextStyleDefault.hintTextStyle),
          ),
        ),
        errorText.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  errorText,
                  style: TextStyleDefault.normalErrorTextStyle,
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
