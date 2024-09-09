import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _display = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';



  void _onPressed(String value) {
    setState(() {
      if (double.tryParse(value) != null || value == '.') {

        if (_display == "0") {
          _display = value;
        } else {
          _display += value;
        }
      } else {
        switch (value) {
          case 'C':
            _display = "0";
            break;
          case '+':
          case '-':
          case '*':
          case '/':
            if (_display != "0") {
              _display += value;
            }
            break;
          case '=':
            try {
              _display = _display.interpret().toString();
            } catch (e) {
              _display = 'Error';
            }
            break;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(32),
              child: Text(
                _display,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildButtonRow(['7', '8', '9', '/']),
          _buildButtonRow(['4', '5', '6', '*']),
          _buildButtonRow(['1', '2', '3', '-']),
          _buildButtonRow(['C', '0', '=', '+']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return CalculatorButton(
          text: button,
          onTap: () => _onPressed(button),
        );
      }).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CalculatorButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
