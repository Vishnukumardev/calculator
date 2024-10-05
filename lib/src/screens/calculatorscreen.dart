import 'package:calculator_app/src/controller/calculatorcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

class Calculatorscreen extends StatefulWidget {
  const Calculatorscreen({super.key});

  @override
  State<Calculatorscreen> createState() => _CalculatorscreenState();
}

class _CalculatorscreenState extends State<Calculatorscreen> {
  @override
  Widget build(BuildContext context) {
    final calculatorState = Provider.of<ProviderState>(context);
    final calculatorController = Get.find<Calculatorcontroller>();

    void onNumberPress(String number) {
      if (calculatorState.displayText == '0') {
        calculatorState.updateDisplay(number);
      } else {
        calculatorState.updateDisplay(calculatorState.displayText + number);
      }
    }

    void onOperationPress(String operation) {
      calculatorController
          .setFirstNumber(double.parse(calculatorState.displayText));
      calculatorController.setOperation(operation);
      calculatorState.clearDisply();
    }

    void onEqualsPress() {
      calculatorController
          .setSecondNumber(double.parse(calculatorState.displayText));
      double result = calculatorController.calculate();
      calculatorState.updateDisplay(result.toString());
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ProviderState>(context, listen: false).toggleTheme();
            },
            icon: Icon(calculatorState.isDarkMode
                ? Icons.toggle_on_outlined
                : Icons.toggle_off_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                calculatorState.displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildButtonRow(
              context, ['7', '8', '9', '/'], onNumberPress, onOperationPress),
          SizedBox(
            height: 5.0,
          ),
          _buildButtonRow(
              context, ['4', '5', '6', '*'], onNumberPress, onOperationPress),
          SizedBox(
            height: 5.0,
          ),
          _buildButtonRow(
              context, ['1', '2', '3', '-'], onNumberPress, onOperationPress),
          SizedBox(
            height: 5.0,
          ),
          _buildButtonRow(context, ['0', 'C', '=', '+'], onNumberPress,
              onOperationPress, onEqualsPress),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context, List<String> labels,
      Function onNumberPress, Function onOperationPress,
      [Function? onEqualPress]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map(
        (label) {
          return GestureDetector(
            onTap: () {
              if (label == 'C') {
                Provider.of<ProviderState>(context, listen: false)
                    .clearDisply();
              } else if (label == '=') {
                if (onEqualPress != null) onEqualPress();
              } else if ('+-*/'.contains(label)) {
                onOperationPress(label);
              } else {
                onNumberPress(label);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
