import 'package:calculator/calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.to(() => CalculatorScreen());
            },
            child: Text('계산기')),
      ),
    );
  }
}
