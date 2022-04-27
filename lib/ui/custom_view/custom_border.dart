import 'package:flutter/material.dart';
import '../../utils/global/globals_functions.dart';
import 'loading.dart';

class CustomBorderLogin extends StatelessWidget {
  const CustomBorderLogin({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: Stack(
        fit: StackFit.expand,
        children: [
          getPngImage('bg_login', boxFit: BoxFit.fill),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
