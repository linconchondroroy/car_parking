import 'package:car_parking/authentication_screen/complet.dart';
import 'package:car_parking/authentication_screen/forgot_password.dart';
import 'package:car_parking/authentication_screen/login_screen.dart';
import 'package:car_parking/authentication_screen/parking_spots.dart';
import 'package:car_parking/authentication_screen/sing_up.dart';
import 'package:car_parking/authentication_screen/verify_screen.dart';
import 'package:car_parking/onboarding_screen/HomePageThree.dart';
import 'package:car_parking/onboarding_screen/HomePageTwo.dart';
import 'package:car_parking/onboarding_screen/HomePageOne.dart';
import 'package:car_parking/reset_password.dart';
import 'package:car_parking/welcome_screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authentication_screen/forgot_otp.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}