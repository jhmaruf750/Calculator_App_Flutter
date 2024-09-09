import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();

  void setValue(String value) {
    String str = compController.text;

    switch (value) {
      case "C":
        compController.clear();
        break;
      case "AC":
        if (str.isNotEmpty) {
          compController.text = str.substring(0, str.length - 1);
        }
        break;
      case "X":
        compController.text += "*";
        break;
      case "=":
        compute();
        break;
      default:
        compController.text += value;
    }
    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));
  }

  void compute() {
    String text = compController.text;
    try {
      text = text.replaceAll("^", "**");

      final result = _evaluateExpression(text);
      compController.text = result.toString();
    } catch (e) {
      compController.text = 'Error';
    }
  }

  double _evaluateExpression(String expression) {

    try {

      final expr = expression.replaceAll("**", "^");
      return _parseSimpleExpression(expr);
    } catch (e) {
      throw Exception('Invalid expression');
    }
  }

  double _parseSimpleExpression(String expression) {

    try {

      final result = double.parse(expression);
      return result;
    } catch (e) {
      throw Exception('Invalid expression');
    }
  }

  @override
  void dispose() {
    compController.dispose();
    super.dispose();
  }
}
