import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        width: Get.width*1,
        height: Get.height*1,
        color: Colors.white,
        child: const Center(
          child: Text('Home'),
        ),
      ),
    );
}
