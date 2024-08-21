
class CalculatorLogic {
  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = '';

  void buttonPressed(String btnValue, Function(String) updateResult) {
    if (btnValue == 'AC') {
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      operation = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'X' ||
        btnValue == '/') {
      if (operation.isEmpty) {
        num1 = double.parse(finalResult);
        operation = btnValue;
        finalResult = '0';
      } else {
        _calculate();
        operation = btnValue;
      }
    } else if (btnValue == '.') {
      if (!finalResult.contains('.')) {
        finalResult += btnValue;
      }
    } else if (btnValue == '+/-') {
      if (finalResult.startsWith('-')) {
        finalResult = finalResult.substring(1);
      } else {
        finalResult = '-' + finalResult;
      }
    } else if (btnValue == '%') {
      num2 = double.parse(finalResult);
      finalResult = (num2 / 100).toString();
    } else if (btnValue == '=') {
      _calculate();
    } else {
      if (finalResult == '0') {
        finalResult = btnValue;
      } else {
        finalResult += btnValue;
      }
    }
    updateResult(finalResult);
  }
  void _calculate() {
    num2 = double.parse(finalResult);
    double result;

    switch (operation) {
      case '+':
        result = num1 + num2;
      case '-':
        result = num1 - num2;
      case 'X':
        result = num1 * num2;
      case '/':
        result = num1 / num2;
      default:
        throw ArgumentError(' invaliedOperation');
    }
    finalResult = result.toString();
    num1 = result;
    operation = '';
  }
}
