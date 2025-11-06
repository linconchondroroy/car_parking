import 'package:flutter/material.dart';

class ReservationScreenFour extends StatelessWidget {
  const ReservationScreenFour({super.key});

  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      /// AppBar
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Booking Information",
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
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),

      /// Body
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // section header (red)
                    Text(
                      "Booking Information",
                      style: TextStyle(
                          color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    SizedBox(height: 12),

                    _KV(title: "Parking Spot Name", value: "Easy Park Spot"),
                    SizedBox(height: 10),
                    _KV(title: "Location", value: "Las Vegas"),
                    SizedBox(height: 10),
                    _KV(title: "Vehicles", value: "Car"),
                    SizedBox(height: 10),
                    _KV(title: "Booking Start", value: "March 25,2025"),
                    SizedBox(height: 10),
                    _KV(title: "Booking End", value: "March 30, 2025"),
                    SizedBox(height: 10),
                    _KV(title: "Per Day", value: "\$25.00"),
                    SizedBox(height: 10),
                    _KV(title: "Total Day", value: "5days"),
                    SizedBox(height: 10),
                    _KV(title: "Remaining Day", value: "2days"),
                    SizedBox(height: 10),
                    _KV(title: "Parking Slot", value: "2"),
                    SizedBox(height: 10),
                    _KV(title: "Total Amount", value: "\$250.00"),
                    SizedBox(height: 10),
                    _KV(title: "Transaction History", value: "1234567891"),
                    SizedBox(height: 10),
                    _KV(title: "Payment By", value: "Credit Card"),
                    SizedBox(height: 28),
                  ],
                ),

                // download icon (bottom-right inside card)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {
                      // TODO: implement download or share receipt
                    },
                    icon: const Icon(Icons.download_rounded,
                        color: kRed, size: 26),
                    splashRadius: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Simple key–value row (bold key + normal value)
class _KV extends StatelessWidget {
  final String title;
  final String value;
  const _KV({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
        children: [
          TextSpan(text: "$title: ", style: const TextStyle(fontWeight: FontWeight.w700)),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
