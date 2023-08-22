import 'package:calculator/calculator/enum.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxString num1 = ''.obs;
  String num0 = '';
  Rx<OperatorType> operator = OperatorType.none.obs;
  KeyType lastKeyType = KeyType.none;

  void onClickNumber(String inputNum) {
    //operator 이후에는 새로운 숫자가 입력되도록 함,
    if (lastKeyType == KeyType.operator) {
      num0 = num1.value;
      num1.value = '';
    }
    //0인데 0을 추가하면 동작하지 않도록 함
    if (num1.value == '0' && inputNum == '0') {
      return;
    }
    num1.value = num1.value + inputNum;
    lastKeyType = KeyType.number;
  }

  void onClickPoint() {
    if (num1.value.contains('.')) {
      //소숫점은 1개만 생기도록 함
      return;
    } else {
      if (num1.value.isEmpty) {
        num1.value = '0';
      }
      num1.value = num1.value + '.';
    }
  }

  void onClickOperator(String name) {
    if (lastKeyType == KeyType.number) {
      onExecute();
    }
    switch (name) {
      case '+':
        operator.value = OperatorType.add;
        break;
      case '-':
        operator.value = OperatorType.subtract;
        break;
      case '*':
        operator.value = OperatorType.multiple;
        break;
      case '/':
        operator.value = OperatorType.divide;
        break;
    }
    lastKeyType = KeyType.operator;
  }

  void onExecute() {
    if (num0.isEmpty) {
      num0 = '0';
    }
    //execute
    switch (operator.value) {
      case OperatorType.add:
        num1.value = (double.parse(num0) + double.parse(num1.value)).toString();
        break;
      case OperatorType.subtract:
        num1.value = (double.parse(num0) - double.parse(num1.value)).toString();
        break;
      case OperatorType.multiple:
        num1.value = (double.parse(num0) * double.parse(num1.value)).toString();
        break;
      case OperatorType.divide:
        num1.value = (double.parse(num0) / double.parse(num1.value)).toString();
        break;
      case OperatorType.none:
        break;
    }

    lastKeyType = KeyType.operator;
    operator.value = OperatorType.none;
  }

  void onClickClear() {
    num1.value = '';
    num0 = '';
    operator.value = OperatorType.none;
    lastKeyType = KeyType.none;
  }
}
