import 'package:calculator/Services/Launch.dart';
import 'package:calculator/Components/Svg.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:calculator/Screens/Home.dart';
import 'package:flutter/material.dart';

int splashTime = 1000;

class Splash extends StatefulWidget
{
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  run() async
  {
    Future.delayed(Duration(milliseconds: splashTime), () async
    {
        Launch().goNoBack(const Home());
    });
  }

  @override
  void initState() {
    super.initState();
    run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.dark,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 100),
          child: const Svg(image:"logo"),
        ),
      ),
    );
  }
}