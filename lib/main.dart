import 'package:flutter/material.dart';

import 'login/default/login_page.dart';

void main() {
  runApp(const AiCalendar());
}

class AiCalendar extends StatelessWidget {
  const AiCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('AiCalendar: Building MaterialApp');
    return MaterialApp(
      title: '天心',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
