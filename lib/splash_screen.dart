import 'package:calculator/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            tag: "go",
            child: CircleAvatar(
              radius: 80, // Set the radius to 80
              backgroundImage: AssetImage("assets/Lavender Calculator App Icon.jpeg"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
