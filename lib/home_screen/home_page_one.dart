import 'package:flutter/material.dart';

class home_page_one extends StatefulWidget {
  const home_page_one({super.key});

  @override
  State<home_page_one> createState() => _home_page_oneState();
}

class _home_page_oneState extends State<home_page_one> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2B4A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2B4A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sabbir Ahmed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight:FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      children: const[
                        Icon(Icons.location_on, color: Colors.white, size: 16,),
                        SizedBox(width: 4,),
                        Text("Bangladesh", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
