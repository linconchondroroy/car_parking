import 'package:flutter/material.dart';

class reset_password extends StatelessWidget {
  const reset_password({super.key});

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
                  child:Column(
                    children: [
                      Image.asset("assets/reset_password.png"),
                      Text("Reset password", style: TextStyle(color: Colors.white, fontSize: 18,),),
                      Text("Password must have 8 characters", style: TextStyle(color: Colors.white,),),
                      SizedBox(height: 10,),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text("New Password", style: TextStyle(color: Colors.white),),
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
                          hint: Text("Confirm Password", style: TextStyle(color: Colors.white),),
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
                      SizedBox(height: 150),
                      Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: InkWell(
                          child: Center(
                            child: Text(
                              "Update Password",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
