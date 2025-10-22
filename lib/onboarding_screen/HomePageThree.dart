import 'package:flutter/material.dart';

class HomePageThree extends StatelessWidget {
  const HomePageThree({super.key});

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
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/home_photo_three.png")),
          SizedBox(height: 10,),
          Text("Why Choose Us",style: TextStyle(fontSize: 30, color: Colors.white),),
          Text("We make parking easy, secure, and stress-free. Whether you're driving a car or a truck, find and reserve reliable parking spots in real-time, wherever you are. With our simple booking and payment system, your parking experience is just a tap away!"),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      child: Center(child: Text("Next")),
                      height: 50, width: 100, color: Colors.red,
                    )
                ),
              ],

            ),
          ),
        ],
      ),

    );
  }
}
