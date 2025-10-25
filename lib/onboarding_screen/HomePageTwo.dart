import 'package:car_parking/onboarding_screen/HomePageThree.dart';
import 'package:flutter/material.dart';

class HomePageTwo extends StatelessWidget {
  const HomePageTwo({super.key});

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
          Center(child: Image.asset("assets/home_photo_two.png")),
          SizedBox(height: 10,),
          Text("Find, Reserve, Park!",style: TextStyle(fontSize: 30, color: Colors.white),),
          Text("With VIP ME, parking has never been easier. Whether you're driving a car or a truck, quickly discover secure, available parking spots nearby, reserve them in real-time, and park with peace of mind. Save time, reduce stress, and never worry about finding parking again!",
          style: TextStyle(color: Colors.white, fontSize: 15),),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>HomePageThree()));
                      },
                      child: Container(
                        child: Center(child: Text("Next")),
                        height: 50, width: 100, color: Colors.red,
                      ),
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
