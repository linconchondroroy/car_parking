import 'package:car_parking/authentication_screen/complet.dart';
import 'package:car_parking/authentication_screen/forget_password_one.dart';
import 'package:car_parking/authentication_screen/forgot_password.dart';
import 'package:car_parking/authentication_screen/login_screen.dart';
import 'package:car_parking/authentication_screen/parking_spots.dart';
import 'package:car_parking/authentication_screen/sing_up.dart';
import 'package:car_parking/authentication_screen/verify_otp.dart';
import 'package:car_parking/authentication_screen/verify_screen.dart';
import 'package:car_parking/home_screen/home_page_one.dart';
import 'package:car_parking/onboarding_screen/HomePageThree.dart';
import 'package:car_parking/onboarding_screen/HomePageTwo.dart';
import 'package:car_parking/onboarding_screen/HomePageOne.dart';
import 'package:car_parking/authentication_screen/reset_password.dart';
import 'package:car_parking/parking_sport/parking_spot_one.dart';
import 'package:car_parking/welcome_screen/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authentication_screen/forgot_otp.dart';
import 'home_screen/Home_page_ten.dart';
import 'home_screen/home_page_eight.dart';
import 'home_screen/home_page_five.dart';
import 'home_screen/home_page_nine.dart';
import 'home_screen/home_page_seven.dart';
import 'home_screen/home_page_six.dart';
import 'home_screen/home_page_three.dart';
import 'home_screen/home_page_two.dart';
import 'home_screen/home_page_four.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParkingSpotOne(),
    );
  }
}