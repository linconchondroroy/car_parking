import 'package:car_parking/authentication_screen/complet.dart';
import 'package:flutter/material.dart';

class parking_spots extends StatelessWidget {
  const parking_spots({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
      ),
      backgroundColor: Colors.indigo.shade700,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,),
                Form(
                    child:Column(
                      children: [
                        Image.asset("assets/parking_spots.png"),
                        Text("Find Nearby Parking Spots", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Enter your location or allow access to find available parking spots near you. Get real-time updates on secure, nearby spaces to park your car or truck with ease.",
                        style: TextStyle(color: Colors.white),),
                        SizedBox(height: 30,),
                        TextFormField(
                          decoration: InputDecoration(
                            hint: Text("Use current location", style: TextStyle(color: Colors.grey),),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon:Icon (Icons.location_on, color: Colors.white,),
                            hint: Text("Enter a new address", style: TextStyle(color: Colors.grey),),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell( onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>complet()));
                        },
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: InkWell(
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text("Forget Password", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have accound ?", style: TextStyle(color: Colors.white),),
                    InkWell(
                      child: Text("Sing Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
