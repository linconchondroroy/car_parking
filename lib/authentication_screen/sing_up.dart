import 'package:car_parking/authentication_screen/forgot_password.dart';
import 'package:car_parking/authentication_screen/verify_screen.dart';
import 'package:flutter/material.dart';

class sing_up extends StatelessWidget {
  const sing_up({super.key});

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
            Image.asset("assets/sing_up.png"),
            SizedBox(height: 10,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hint: Text("User Name",style: TextStyle(color: Colors.white),),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,width: 2),
                ),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,color: Colors.white,),
                hint: Text("@example.com",style: TextStyle(color: Colors.white),),
                suffixIcon: Icon(Icons.check_box,color: Colors.grey,),
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
            SizedBox(height: 5,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hint: Text("Confirm Password",style: TextStyle(color: Colors.white),),
                suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                border: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            SizedBox(height: 5,),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hint: Text("Confirm Password",style: TextStyle(color: Colors.white),),
                suffixIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                border: OutlineInputBorder(
                  borderSide:const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>verify_screen()));
                },
                child: Center(
                  child: Text("Sing Up", style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
        ),
      ),
    );

  }
}
