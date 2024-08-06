// main.dart or home_page.dart

import 'package:flutter/material.dart';
import 'calculator_methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController con1 = TextEditingController();
  final TextEditingController con2 = TextEditingController();
  String result = "0.0";

  void calculate(String operation) {
    double num1 = double.tryParse(con1.text) ?? 0;
    double num2 = double.tryParse(con2.text) ?? 0;

    double calcResult;
    try {
      switch (operation) {
        case '+':
          calcResult = add(num1, num2);
          break;
        case '-':
          calcResult = subtract(num1, num2);
          break;
        case 'x':
          calcResult = multiply(num1, num2);
          break;
        case '/':
          calcResult = divide(num1, num2);
          break;
        default:
          calcResult = 0;
      }
      setState(() {
        result = calcResult.toStringAsFixed(2); // عرض رقمين بعد العلامة العشرية
      });
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    }
  }

  void reset() {
    setState(() {
      result = '0.0';
    });
    resetControllers(con1, con2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8c7851),
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 28,
            color: Color(0xfff25042),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffeaddcf),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 22),
            TextFormField(
              textAlign: TextAlign.start,
              controller: con1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Enter number 1',
                labelStyle: TextStyle(
                  color: Color(0xff8c7851),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            TextFormField(
              textAlign: TextAlign.start,
              controller: con2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Enter number 2',
                labelStyle: TextStyle(
                  color: Color(0xff8c7851),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xfff25042),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff8c7851),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff8c7851),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('x'),
                  child: Text(
                    "x",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff8c7851),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: Text(
                    "/",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff8c7851),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Text(
              "Result:",
              style: TextStyle(fontSize: 30, color: Color(0xfff25042)),
            ),
            SizedBox(height: 8),
            Text(
              result,
              style: TextStyle(fontSize: 30, color: Color(0xfff25042)),
            ),
            SizedBox(height: 18),
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xfff25042),
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                onPressed: reset,
                child: Text(
                  "Reset",
                  style: TextStyle(fontSize: 20, color: Color(0xff8c7851)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
