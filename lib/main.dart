import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String _currentInput = "0";
  String _previousInput = "";
  String _operation = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _currentInput = "0";
        _previousInput = "";
        _operation = "";
      } else if (value == "=") {
        if (_operation.isNotEmpty && _previousInput.isNotEmpty) {
          double num1 = double.tryParse(_previousInput) ?? 0;
          double num2 = double.tryParse(_currentInput) ?? 0;
          switch (_operation) {
            case "+":
              _currentInput = (num1 + num2).toString();
              break;
            case "-":
              _currentInput = (num1 - num2).toString();
              break;
            case "x":
              _currentInput = (num1 * num2).toString();
              break;
            case "/":
              _currentInput = (num2 != 0) ? (num1 / num2).toString() : "Error";
              break;
          }
          _previousInput = "";
          _operation = "";
        }
      } else if (value == "+" || value == "-" || value == "x" || value == "/") {
        _previousInput = _currentInput;
        _operation = value;
        _currentInput = "0";
      } else {
        if (_currentInput == "0") {
         
