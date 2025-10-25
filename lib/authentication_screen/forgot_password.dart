import 'package:car_parking/authentication_screen/forgot_otp.dart';
import 'package:car_parking/authentication_screen/sing_up.dart';
import 'package:flutter/material.dart';

class forgot_password extends StatelessWidget {
  const forgot_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
      ),
      backgroundColor: Colors.indigo.shade700,
      body: Center(
        child: Padding(padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10,),
            Form(child: Column(
              children: [
                Image.asset("assets/reset_password.png"),
                SizedBox(height: 10,),
                Text("Resert Password", style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w600 ),),
                SizedBox(height: 5,),
                Text("Password must have 8 charcter", style: TextStyle(color: Colors.white,fontSize:14, fontWeight: FontWeight.w400,),),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white,),
                    hint: Text("New Password", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w400),),
                    suffixIcon: Icon(Icons.check_box, color: Colors.grey ,),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white,),
                    hint: Text("Confirm password", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w400),),
                    suffixIcon: Icon(Icons.check_box, color: Colors.grey ,),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>sing_up()));
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text("Get OTP",
                  style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ) ,
        ),
      ),
    );
  }
}
