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

  Color getTextColor(int index) {
    return index < 3 ? Colors.black : Colors.white;
  }

  Color getBackgroundColor(int index) {
    if (index < 3) {
      return Colors.grey[400] ?? Colors.grey;
    }
    if (index == 18) {
      return Colors.orange;
    }
    return index % 4 == 3
        ? Colors.amber[800] ?? Colors.amber
        : Colors.grey[800] ?? Colors.grey;
  }

  Widget buttonForm(String text, int index) {
    return text != '0'
        ? Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  _calculatorLogic.buttonPressed(text, _updateResult);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  backgroundColor: getBackgroundColor(index),
                ),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 24, color: getTextColor(index)),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                _calculatorLogic.buttonPressed(text, _updateResult);
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.fromLTRB(25, 20, 90, 20),
                backgroundColor: getBackgroundColor(index),
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 24, color: getTextColor(index)),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttonLabels = [
      "AC",
      "+/-",
      "%",
      "/",
      "7",
      "8",
      "9",
      "X",
      "4",
      "5",
      "6",
      "-",
      "1",
      "2",
      "3",
      "+",
      "0",
      ".",
      "="
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 135),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Text(
                    "$_displayResult",
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            for (int i = 0; i < buttonLabels.length; i += 4)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int j = 0; j < 4; j++)
                    if (i + j < buttonLabels.length)
                      buttonForm(buttonLabels[i + j], i + j),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
