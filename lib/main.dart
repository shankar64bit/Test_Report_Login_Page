// import 'package:ark_power_login/google_login_controller.dart';
// import 'package:ark_power_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:testreportsignin/injection_container.dart';
import 'login_page.dart';

void main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TestReportLogin',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Robo'),
      home: LoginPage(),
    );
  }
}
