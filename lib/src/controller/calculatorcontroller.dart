import 'package:get/get.dart';

class Calculatorcontroller extends GetxController {
  double _firstNumber = 0;
  double _secondNumber = 0;
  String _operation = '';

  void setFirstNumber(double number) {
    _firstNumber = number;
  }

  void setSecondNumber(double number) {
    _secondNumber = number;
  }

  void setOperation(String operation) {
    _operation = operation;
  }

  double calculate() {
    switch (_operation) {
      case '+':
        return (_firstNumber + _secondNumber) ;
      case '-':
        return _firstNumber - _secondNumber;
      case '*':
        return _firstNumber * _secondNumber;
      case '/':
        return _firstNumber / _secondNumber;
      default:
        return 0;
    }
  }

  
}
