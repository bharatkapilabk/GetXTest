import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/activities/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        home: LoginScreen(),
      );
}
