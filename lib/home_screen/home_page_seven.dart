import 'package:flutter/material.dart';

class HomeScreenSeven extends StatefulWidget {
  const HomeScreenSeven({super.key});

  @override
  State<HomeScreenSeven> createState() => _HomeScreenSevenState();
}

class _HomeScreenSevenState extends State<HomeScreenSeven> {
  // 🎨 Theme colors
  final Color kPrimary = const Color(0xFFE8505B);
  final Color kBackground = const Color(0xFF23335F);
  final Color kCard = Colors.white;
  final Color kTextDark = const Color(0xFF1E2A3B);
  final Color kTextLite = const Color(0xFF8A94A6);

  String? billingType;
  TimeOfDay? checkInTime;

  // Pick time
  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: checkInTime ?? TimeOfDay.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => checkInTime = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // 🧾 Scroll Content
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _parkingInfoCard(),
                  const SizedBox(height: 16),
                  _billingInfoCard(),
                ],
              ),
            ),

            // 🔙 Top AppBar style
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimary,
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
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Booking Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔘 Bottom Button
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          color: kBackground,
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Continue pressed")),
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
                "Continue",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Parking Info Card ---
  Widget _parkingInfoCard() {
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
            "Parking Spot Information",
            style: TextStyle(color: kPrimary, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            "Las Vegas, NV Truck and Trailer Parking",
            style: TextStyle(color: kTextDark, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: kTextLite, size: 18),
              const SizedBox(width: 6),
              Text("Las Vegas - 4.6 Km",
                  style: TextStyle(color: kTextDark, fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text("Price: \$25/Day",
                  style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700)),
              const SizedBox(width: 12),
              Text("Price: \$100/Week",
                  style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("4.4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    SizedBox(width: 4),
                    Icon(Icons.star, color: Colors.white, size: 14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Billing Info Card ---
  Widget _billingInfoCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Billing Information",
            style: TextStyle(color: kPrimary, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),

          // Billing Type Dropdown
          _inputLabel("Billing Type"),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary.withOpacity(0.6), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            value: billingType,
            items: const [
              DropdownMenuItem(value: "Day", child: Text("Day/Weekly")),
              DropdownMenuItem(value: "Month", child: Text("Monthly")),
            ],
            onChanged: (val) => setState(() => billingType = val),
          ),
          const SizedBox(height: 14),

          // Time Picker
          _inputLabel("Expected Check-in Time"),
          const SizedBox(height: 6),
          InkWell(
            onTap: _pickTime,
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimary.withOpacity(0.6), width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimary, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(Icons.access_time, color: kPrimary),
              ),
              child: Text(
                checkInTime != null
                    ? checkInTime!.format(context)
                    : "08:00",
                style: TextStyle(color: kTextDark, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Enter Slot
          _inputLabel("Enter Your Slot (6/12)"),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Your Slot",
              suffixIcon: Icon(Icons.event_seat, color: kPrimary),
              hintStyle: TextStyle(color: kTextLite),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary.withOpacity(0.6), width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputLabel(String text) => Text(
    text,
    style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700),
  );
}
