import 'package:flutter/material.dart';

class HomeScreenThree extends StatelessWidget {
  const HomeScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🗺️ Full Screen Map Image
          Positioned.fill(
            child: Image.asset(
              "assets/full_screen_map_one.png", // তোমার map image
              fit: BoxFit.cover,
            ),
          ),

          // ⬅️ Top-left Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8505B),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  iconSize: 26,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),

          // 📍 Example Location Marker (middle area)
          Positioned(
            top: 300,
            left: 180,
            child: GestureDetector(
              onTap: () {
                debugPrint("Location pin tapped!");
              },
              child: const Icon(
                Icons.location_on,
                color: Color(0xFFE8505B),
                size: 40,
              ),
            ),
          ),

          // 🎯 Bottom-right Target Button
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8505B),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.gps_fixed, color: Colors.white),
                    iconSize: 28,
                    onPressed: () {
                      debugPrint("Zoom/Target button pressed!");
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
