import 'package:flutter/material.dart';

class FavoriteScreenEight extends StatelessWidget {
  const FavoriteScreenEight({super.key});

  Color get kPrimary => const Color(0xFFE8505B); // CTA/Back button
  Color get kBg => const Color(0xFF23335F);      // Background (your color)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Stack(
          children: [
            // ⬅️ Top-left back
            Positioned(
              top: 12,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE8505B),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3)),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // 🎉 Content
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Confetti + big check inside white circle
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // confetti dots (simple manual layout)
                        ..._confettiDots(),
                        // main white circle
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.check, size: 90, color: kBg),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Payment Successful!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your Turf spot booking has been successfully\nreserved",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(.85),
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ⬇️ Bottom sheet style with rounded top & CTA
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, -4)),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Replace with Navigator.pushReplacementNamed(context, '/home');
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Go Home",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ছোট সাদা confetti ডটগুলোর পজিশন — স্ক্রিনশটের vibe দিতে হালকা ছড়িয়ে দেওয়া হয়েছে।
  List<Widget> _confettiDots() {
    const positions = <Offset>[
      Offset(-80, -60), Offset(-40, -90), Offset(30, -100), Offset(85, -60),
      Offset(100, -10), Offset(75, 40), Offset(20, 80), Offset(-35, 85),
      Offset(-85, 40), Offset(-110, -10), Offset(-60, -20), Offset(60, -20),
      Offset(-10, -120), Offset(-15, 110),
    ];
    return positions
        .map((p) => Positioned(
      left: 110 + p.dx,
      top: 110 + p.dy,
      child: Container(
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ))
        .toList();
  }
}
