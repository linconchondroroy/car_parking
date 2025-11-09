import 'package:flutter/material.dart';

class NotificationsScreenTwo extends StatelessWidget {
  const NotificationsScreenTwo({super.key});

  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      // AppBar
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: const BoxDecoration(color: kRed, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),
        ),
      ),

      // Body (empty state)
      body: Center(
        child: SizedBox(
          width: 260,
          height: 260,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // soft background bars (to mimic illustration)
              _bar(width: 200, top: 40, opacity: .25),
              _bar(width: 160, top: 78, opacity: .22),
              _bar(width: 220, top: 116, opacity: .20),

              // shadow bell behind (light gray)
              Transform.translate(
                offset: const Offset(24, 10),
                child: Icon(
                  Icons.notifications,
                  size: 150,
                  color: Colors.white.withOpacity(.14),
                ),
              ),

              // front bell (stroke look using two icons)
              // outer (for a thin outline)
              Icon(Icons.notifications_none,
                  size: 150, color: Colors.white.withOpacity(.85)),
              // inner highlight rim
              Positioned(
                bottom: 52,
                child: Container(
                  width: 120,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFFCC8A), width: 3),
                    color: Colors.transparent,
                  ),
                ),
              ),

              // badge "0" on top-right
              Positioned(
                right: 62,
                top: 56,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
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

  // small rounded bars for background decoration
  static Widget _bar({required double width, required double top, double opacity = .2}) {
    return Positioned(
      top: top,
      child: Container(
        width: width,
        height: 26,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(opacity),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
