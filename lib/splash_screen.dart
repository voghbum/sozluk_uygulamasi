import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:json_deneme_2/ana_sayfa.dart';
import 'internet_kontrolu.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var connectResult;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2100,
      splash: Icon(
        Icons.account_balance,
        size: 100,
        color: Colors.red,
      ),
      nextScreen: AnaSayfa(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}