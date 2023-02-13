// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_dday_counter/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'HiMelody',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: 'Cookie',
            fontSize: 70,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}
