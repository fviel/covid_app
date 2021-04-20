import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid_app/constant.dart';
import 'package:covid_app/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
            bodyText2: TextStyle(
          color: kBodyTextColor,
        )),
      ),
      home: HomeScreen(),
    //home: InfoScreen(),
    );
  }
}






