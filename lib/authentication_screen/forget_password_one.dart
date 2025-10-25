import 'package:car_parking/authentication_screen/forgot_otp.dart';
import 'package:flutter/material.dart';

class forgot_password_one extends StatelessWidget {
   forgot_password_one({super.key});

  final _formKey = GlobalKey<FormState>();
  // === Validation patterns ===
  static RegExp emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');
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
              Form(
                key: _formKey,
                child: Column(
                children: [
                  Image.asset("assets/forgot_password_screen.png"),
                  SizedBox(height: 10,),
                  Text("Forget Password", style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.w600 ),),
                  SizedBox(height: 5,),
                  Text("Password must have 8 charcter", style: TextStyle(color: Colors.white,fontSize:14, fontWeight: FontWeight.w400,),),
                  SizedBox(height: 10,),
                  TextFormField(
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      } else if (!emailRegexp.hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white,),
                      hint: Text("Enter your email", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w400),),
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
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 8) {
                      return "Password must be at least 8 characters";
                      } else if (!passRegExp.hasMatch(value)) {
                      return "Password must contain both letters and numbers";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white,),
                      hint: Text("Enter your password", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w400),),
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

                  if (_formKey.currentState!.validate()) {
                    // সব কিছু valid হলে এখানে আসবে
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("✅ All fields are valid!")),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>forgot_otp()));
                  }
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
