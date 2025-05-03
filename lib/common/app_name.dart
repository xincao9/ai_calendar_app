import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  final double width;

  const AppName({super.key, this.width = 45});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/default/login/app_name.png',
      width: width,
      height: width * 0.4,
      fit: BoxFit.contain,
    );
  }
}
