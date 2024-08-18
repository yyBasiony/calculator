import 'package:flutter/material.dart';
import 'package:calculator/calculator_methods.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CalculatorLogic _calculatorLogic = CalculatorLogic();
  String _displayResult = '0';

  void _updateResult(String result) {
    setState(() {
      _displayResult = result;
    });
  }

  Widget buttonForm(String text, Color textColor, Color backgroundColor) {
    return text != '0'
        ? Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: MaterialButton(
          onPressed: () {
            _calculatorLogic.buttonPressed(text, _updateResult);
          },
          shape: CircleBorder(),
          padding: EdgeInsets.all(10),
          color: backgroundColor,
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: textColor),
          ),
        ),
      ),
    )
        : Container(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        onPressed: () {
          _calculatorLogic.buttonPressed(text, _updateResult);
        },
        shape: StadiumBorder(),
        padding: EdgeInsets.fromLTRB(25, 20, 90, 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
        color: backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<List<Map<String, dynamic>>> buttons = [
      [
        {"text": "AC", "textColor": Colors.black, "backgroundColor": Colors.grey},
        {"text": "+/-", "textColor": Colors.black, "backgroundColor": Colors.grey},
        {"text": "%", "textColor": Colors.black, "backgroundColor": Colors.grey},
        {"text": "/", "textColor": Colors.white, "backgroundColor": Colors.amber[800]},
      ],
      [
        {"text": "7", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "8", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "9", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "X", "textColor": Colors.white, "backgroundColor": Colors.amber[800]},
      ],
      [
        {"text": "4", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "5", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "6", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "-", "textColor": Colors.white, "backgroundColor": Colors.amber[800]},
      ],
      [
        {"text": "1", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "2", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "3", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "+", "textColor": Colors.white, "backgroundColor": Colors.amber[800]},
      ],
      [
        {"text": "0", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": ".", "textColor": Colors.white, "backgroundColor": Colors.grey[800]},
        {"text": "=", "textColor": Colors.white, "backgroundColor": Colors.amber[800]},
      ],
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  "$_displayResult",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            for (var row in buttons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: row.map((button) {
                  return buttonForm(button["text"], button["textColor"], button["backgroundColor"]);
                }).toList(),
              ),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
