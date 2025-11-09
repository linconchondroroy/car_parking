import 'package:flutter/material.dart';

class ProfileScreenSix extends StatelessWidget {
  const ProfileScreenSix({super.key});

  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      // AppBar
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Transaction History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: const BoxDecoration(color: kRed, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),

      // Body: centered illustration
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320, maxHeight: 420),
          child: Image.asset(
            "assets/no_data.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
