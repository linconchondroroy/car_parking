import 'package:flutter/material.dart';

class complet extends StatelessWidget {
  const complet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo.shade700),
      backgroundColor: Colors.indigo.shade700,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/complet.png"),
            SizedBox(height: 10,),
            Text(
              "Thank You for Signing Up!",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Welcome to our VIP ME application. Get ready for exclusive access to hassle-free car and truck parking!",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 250,),
            InkWell(
              child: Container(
                 height: 40,
                width: double.infinity,
                child: Center(child: Text("Continue", style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
