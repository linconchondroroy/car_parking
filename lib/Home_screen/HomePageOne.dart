import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
      body: Padding(padding: const EdgeInsets.symmetric(vertical: 40)),
    );
  }
}