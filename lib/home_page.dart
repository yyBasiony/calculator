import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '0';
  String finalResult = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operation = '';

  bottomPressed(String btnValue) {
    if (btnValue == 'AC') {
      finalResult = '0';
      num1 = 0.0;
      num2 = 0.0;
      operation = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'X' ||
        btnValue == '/') {
      num1 = double.parse(result);
      operation = btnValue;
      finalResult = '0';
      result = result + btnValue;
    } else if (btnValue == '.') {
      if (finalResult.contains('.')) {
        // Do nothing if already contains a dot
      } else {
        finalResult = finalResult + btnValue;
      }
    } else if (btnValue == '+/-') {
      if (result.toString().contains('-')) {
        result = result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-' + result;
        finalResult = result;
      }
    } else if (btnValue == '%') {
      num2 = double.parse(result);
      finalResult = (num2 / 100).toString();
    } else if (btnValue == '=') {
      num2 = double.parse(result);
      if (operation == '+') {
        finalResult = (num1 + num2).toString();
      }
      if (operation == '-') {
        finalResult = (num1 - num2).toString();
      }
      if (operation == 'X') {
        finalResult = (num1 * num2).toString();
      }
      if (operation == '/') {
        finalResult = (num1 / num2).toString();
      }
    } else {
      finalResult = finalResult + btnValue;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget buttonForm(String text, Color textColor, Color backgroundColor) {
    if(text!='0'){
      return Expanded(  // Wrap each button with Expanded
        child: Container(
          padding: EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () {
              bottomPressed(text);
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
      );

    }else{
      return Container(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          onPressed: () {
            bottomPressed(text);
            // Add your button onPressed logic here
          },
          shape: StadiumBorder(), // Fix typo here
          padding: EdgeInsets.fromLTRB(25, 20, 90, 20), // Increase button padding
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: textColor), // Decrease font size
          ),
          color: backgroundColor,
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Padding(
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
                  "$finalResult",
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
                buttonForm("AC", Colors.black, Colors.grey),
                buttonForm("+/-", Colors.black, Colors.grey),
               buttonForm("%", Colors.black, Colors.grey),
               buttonForm("/", Colors.white, Colors.amber[800]!),
               ],
            ),
            SizedBox(height: 8), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("7", Colors.white, Colors.grey[800]!),
                buttonForm("8", Colors.white, Colors.grey[800]!),
                buttonForm("9", Colors.white, Colors.grey[800]!),
                buttonForm("X", Colors.white, Colors.amber[800]!),
              ],
            ),
            SizedBox(height: 8), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("4", Colors.white, Colors.grey[800]!),
                buttonForm("5", Colors.white, Colors.grey[800]!),
                buttonForm("6", Colors.white, Colors.grey[800]!),
                buttonForm("-", Colors.white, Colors.amber[800]!),
              ],
            ),
            SizedBox(height: 8), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("1", Colors.white, Colors.grey[800]!),
                buttonForm("2", Colors.white, Colors.grey[800]!),
                buttonForm("3", Colors.white, Colors.grey[800]!),
                buttonForm("+", Colors.white, Colors.amber[800]!),
              ],
            ),
            SizedBox(height: 8), // Increase spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm("0", Colors.white, Colors.grey[800]!),
                buttonForm(".", Colors.white, Colors.grey[800]!),
                buttonForm("=", Colors.white, Colors.amber[800]!),
              ],
            ),
           ],
         ),
      ),
    );
  }
}
