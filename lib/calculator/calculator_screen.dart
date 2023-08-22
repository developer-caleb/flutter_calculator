import 'package:calculator/calculator/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController c = Get.put(CalculatorController());
    return Scaffold(
      appBar: AppBar(
        title: Text('계산기'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffBFB8DA),
        ),
        child: Column(
          children: [
            display(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: keyRow1()),
            Expanded(child: keyRow2()),
            Expanded(flex: 3, child: keyRow3()),
          ],
        ),
      ),
    );
  }

  Row keyRow3() {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: keyButton(name: '4')),
                      Expanded(child: keyButton(name: '5')),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: keyButton(name: '1')),
                      Expanded(child: keyButton(name: '2')),
                    ],
                  ),
                ),
                Expanded(child: keyButton(name: '0')),
              ],
            )),
        Expanded(
            child: Column(
          children: [
            Expanded(child: keyButton(name: '6')),
            Expanded(child: keyButton(name: '3')),
            Expanded(child: keyButton(name: '.')),
          ],
        )),
        Expanded(child: keyButton(name: '=')),
      ],
    );
  }

  Row keyRow2() {
    return Row(
      children: [
        Expanded(child: keyButton(name: '7')),
        Expanded(child: keyButton(name: '8')),
        Expanded(child: keyButton(name: '9')),
        Expanded(child: keyButton(name: 'C')),
      ],
    );
  }

  Row keyRow1() {
    return Row(
      children: [
        Expanded(child: keyButton(name: '+')),
        Expanded(child: keyButton(name: '-')),
        Expanded(child: keyButton(name: '*')),
        Expanded(child: keyButton(name: '/')),
      ],
    );
  }

  Widget keyButton({
    required String name,
  }) {
    CalculatorController controller = Get.find<CalculatorController>();
    return InkWell(
      onTap: () {
        switch (name) {
          case '0':
          case '1':
          case '2':
          case '3':
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
            controller.onClickNumber(name);
            break;
          case '.':
            controller.onClickPoint();
          case 'C':
            controller.onClickClear();
            break;
          case '*':
          case '+':
          case '-':
          case '/':
            controller.onClickOperator(name);
            break;
          case '=':
            controller.onExecute();
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff6F5F90),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Container display() {
    CalculatorController controller = Get.find<CalculatorController>();
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffFFFFFF)),
      child: Obx(() => Row(
            children: [
              Text(controller.operator.value.toText()),
              Spacer(),
              Text(
                controller.num1.value.isEmpty ? '0' : controller.num1.value.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                textAlign: TextAlign.right,
              ),
            ],
          )),
    );
  }
}
