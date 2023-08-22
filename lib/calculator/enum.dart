enum OperatorType {
  add,
  subtract,
  multiple,
  divide,
  none;

  String toText() {
    switch (this) {
      case add:
        return '+';
      case subtract:
        return '-';
      case multiple:
        return '*';
      case divide:
        return '/';
      case none:
        return '';
    }
  }
}

enum KeyType { number, operator, none }
