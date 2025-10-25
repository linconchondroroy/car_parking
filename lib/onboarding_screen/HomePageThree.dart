import 'package:car_parking/authentication_screen/login_screen.dart';
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
          Text("Real-Time Parking Updates",style: TextStyle(fontSize: 30, color: Colors.white),),
          Text("With VIP ME, you can view live parking availability in your area. Get real-time updates on available spots, ensuring you always find a safe and convenient place to park—no more wasted time searching!"),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>login_screen()));
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
