import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;

  const Logo({super.key, this.width = 70});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/default/login/logo.png',
      width: width,
      height: width,
      fit: BoxFit.contain,
    );
  }
}
