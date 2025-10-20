import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
      backgroundColor: Colors.blueAccent,
        title: Align(
          alignment: Alignment.bottomRight,
          child:Text("Skip", style: TextStyle(fontSize: 18, color: Colors.blueGrey),)
          ),
        ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(child: Image.asset("asset/hpme_photo_one.png")),
                SizedBox(
                  height: 40,
                ),
                Text("Why Choose Us", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child: Text("We make parking easy, secure, and stress-free. Whether you're driving a car or a truck, find and reserve reliable parking spots in real-time, wherever you are. With our simple booking and payment system, your parking experience is just a tap away!",
                  style: TextStyle(color: Colors.white, fontSize: 15, letterSpacing: 0.8),
                ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
