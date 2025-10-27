
import 'package:car_parking/authentication_screen/forgot_password.dart';
import 'package:flutter/material.dart';

class verify_otp extends StatelessWidget {
  const verify_otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10),
              Form(
                child: Column(
                  children: [
                    Image.asset("assets/forgot_otp.png"),
                    SizedBox(height: 10,),
                    Text("We've Sent a Code to exa...@email.com",style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 60,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        separatorBuilder: (context, index) => SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/6-16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 7}',
                              style: TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If you didn't receive code ",style: TextStyle(color: Colors.white),),
                        Text("Respons it",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                      ],
                    )


                  ],
                ),
              ),

              InkWell(
                onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>forgot_password())),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}