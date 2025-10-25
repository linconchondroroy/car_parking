import 'package:car_parking/onboarding_screen/HomePageOne.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    // Delay of 4 seconds before navigating to next page
    Future.delayed(const Duration(seconds: 4), () {
      // After 4 seconds, navigate to NextPage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePageOne()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      body: Center(
        child: Image.asset("assets/splash_screen.png"),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: const Center(
        child: Text('Welcome to the next page!'),
      ),
    );
  }
}
