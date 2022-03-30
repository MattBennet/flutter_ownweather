import 'package:flutter/material.dart';
import 'package:flutter_ownweather/screens/loading_screen.dart';
import 'package:flutter_ownweather/screens/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashScreen.newInstance(),
    );
  }
}
