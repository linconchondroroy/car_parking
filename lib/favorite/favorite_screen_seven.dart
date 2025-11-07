import 'package:flutter/material.dart';

class FavoriteScreenSeven extends StatefulWidget {
  const FavoriteScreenSeven({super.key});

  @override
  State<FavoriteScreenSeven> createState() => _FavoriteScreenSevenState();
}

class _FavoriteScreenSevenState extends State<FavoriteScreenSeven> {
  final Color kPrimary = const Color(0xFFE8505B);
  final Color kBackground = const Color(0xFF23335F);
  final Color kCard = Colors.white;
  final Color kTextDark = const Color(0xFF1E2A3B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable Content
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _infoCard(
                    title: "Billing Information",
                    children: [
                      _row("Billing Type", "Day"),
                      _row("Start Date", "March 25, 2025"),
                      _row("End Date", "March 30, 2025"),
                      _row("Check-in Time", "08:00AM"),
                      _row("Parking Slot", "2 Slot"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _infoCard(
                    title: "Vehicles Information",
                    children: [
                      _row("Vehicles Type", "Car"),
                      _row("Car Type", "Personal"),
                      _row("Car Make", "BMW"),
                      _row("Car Model", "BMW X7"),
                      _row("Car license plate", "123456"),
                      _row("Car VIN Number", "12345678"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _infoCard(
                    title: "Payment Information",
                    children: [
                      _row("Booking Start", "March 25, 2025"),
                      _row("Booking End", "March 30, 2025"),
                      _row("Per Day", "\$25.00"),
                      _row("Total Day", "5 days"),
                      _row("Parking Slot", "2"),
                      _row("Total Amount", "\$250.00"),
                    ],
                  ),
                ],
              ),
            ),

            // AppBar (Back + Title)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimary,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Booking Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Payment Button
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: kBackground,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Payment Now tapped")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Payment Now",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Info Card Builder
  Widget _infoCard({required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  // 🔹 Row Widget (key-value pair)
  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              color: kTextDark,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: kTextDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
