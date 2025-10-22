import 'package:car_parking/authentication_screen/login_screen.dart';
import 'package:car_parking/onboarding_screen/HomePageThree.dart';
import 'package:car_parking/onboarding_screen/HomePageTwo.dart';
import 'package:car_parking/onboarding_screen/HomePageOne.dart';
import 'package:car_parking/welcome_screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: login_screen(),
    );
  }
}