import 'package:flutter/material.dart';

class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

class _HomeScreenOneState extends State<HomeScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/profile_photo.png"),
         ) ,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lincon Roy", style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text("Bangladesh", style: TextStyle(color: Colors.white,fontSize: 15),
                ),
                const SizedBox(width: 4,),
                const Icon(Icons.location_on,color: Colors.white,size: 15,),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.circle_notifications_sharp,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(
                Icons.compare_arrows_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
