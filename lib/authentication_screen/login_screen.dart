import 'package:car_parking/authentication_screen/forget_password_one.dart';
import 'package:car_parking/authentication_screen/forgot_password.dart';
import 'package:flutter/material.dart';

class login_screen extends StatelessWidget {
   login_screen({super.key});
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
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10,),
              Form(
                key: _formKey,
                  child:Column(
                    children: [
                      Image.asset("assets/login_screen.png"),
                      SizedBox(height: 10,),
                      TextFormField(
                        validator: (value){
                          // === Validators ===

                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            } else if (!emailRegexp.hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;

                        },
                        decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email,color: Colors.white,),
                          hint: Text("Enter your mail", style: TextStyle(color: Colors.white),),
                          suffixIcon: Icon(Icons.check_box, color: Colors.grey,),
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
                          prefixIcon:Icon (Icons.email, color: Colors.white,),
                          hint: Text("Password", style: TextStyle(color: Colors.white),),
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
                      Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: InkWell(
                          onTap: (){
                            if (_formKey.currentState!.validate()) {
                              // সব কিছু valid হলে এখানে আসবে
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("✅ All fields are valid!")),
                              );
                            Navigator.push(context, MaterialPageRoute(builder: (c)=>forgot_password_one()));
                            }
                          },
                          child: Center(
                            child: Text(
                              "Sing In",
                              style: TextStyle(color: Colors.white),
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
    );
  }
}
