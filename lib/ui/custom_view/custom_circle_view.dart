import 'package:flutter/material.dart';

class CustomCircleView extends StatelessWidget {
  const CustomCircleView(
      {Key? key, required this.child, this.gradient, this.color})
      : super(key: key);
  final Widget child;
  final Gradient? gradient;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: color, gradient: gradient),
        child: child);
  }
}
