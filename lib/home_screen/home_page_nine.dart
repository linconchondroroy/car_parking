import 'package:flutter/material.dart';

class HomeScreenNine extends StatefulWidget {
  const HomeScreenNine({super.key});

  @override
  State<HomeScreenNine> createState() => _HomeScreenNineState();
}

class _HomeScreenNineState extends State<HomeScreenNine> {
  // Colors
  static const Color kBg = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  // Dropdown state
  String? _vehicleType;
  String? _truckType;

  // Text controllers
  final _makeCtrl = TextEditingController();
  final _plateCtrl = TextEditingController();
  final _vinCtrl = TextEditingController();

  @override
  void dispose() {
    _makeCtrl.dispose();
    _plateCtrl.dispose();
    _vinCtrl.dispose();
    super.dispose();
  }

  InputDecoration _inputDec(String hint) {
    const radius = BorderRadius.all(Radius.circular(10));
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: const BorderSide(color: kRed, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: const BorderSide(color: kRed, width: 1.6),
      ),
    );
  }

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
          "Booking Information",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        // round back button
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: const BoxDecoration(color: kRed, shape: BoxShape.circle),
              child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
            ),
          ),
        ),
      ),

      // Body
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 110),
          child: Column(
            children: [
              // ----- Billing information card -----
              _sectionCard(
                title: "Billing Information",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _KV(title: "Billing Type", value: "Day"),
                    SizedBox(height: 10),
                    _KV(title: "Start Date", value: "March 25,2025"),
                    SizedBox(height: 10),
                    _KV(title: "End Date", value: "March 30,2025"),
                    SizedBox(height: 10),
                    _KV(title: "Check-in Time", value: "08:00AM"),
                    SizedBox(height: 10),
                    _KV(title: "Parking Slot", value: "2 Slot"),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ----- Vehicles information card -----
              _sectionCard(
                title: "Vehicles Information",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _FieldLabel("Select Vehicles"),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _vehicleType,
                      items: const [
                        DropdownMenuItem(value: "Car/Truck", child: Text("Car/Truck")),
                        DropdownMenuItem(value: "Motorcycle", child: Text("Motorcycle")),
                        DropdownMenuItem(value: "Van", child: Text("Van")),
                      ],
                      onChanged: (v) => setState(() => _vehicleType = v),
                      decoration: _inputDec("Car/Truck"),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black54),
                    ),

                    const SizedBox(height: 14),
                    const _FieldLabel("Truck Type"),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _truckType,
                      items: const [
                        DropdownMenuItem(value: "Personal/Company", child: Text("Personal/Company")),
                        DropdownMenuItem(value: "Personal", child: Text("Personal")),
                        DropdownMenuItem(value: "Company", child: Text("Company")),
                      ],
                      onChanged: (v) => setState(() => _truckType = v),
                      decoration: _inputDec("Personal/Company"),
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black54),
                    ),

                    const SizedBox(height: 14),
                    const _FieldLabel("Truck Make"),
                    const SizedBox(height: 6),
                    TextField(controller: _makeCtrl, decoration: _inputDec("Type Here")),

                    const SizedBox(height: 14),
                    const _FieldLabel("Truck Plate"),
                    const SizedBox(height: 6),
                    TextField(controller: _plateCtrl, decoration: _inputDec("license plate number")),

                    const SizedBox(height: 14),
                    const _FieldLabel("Truck VIN"),
                    const SizedBox(height: 6),
                    TextField(controller: _vinCtrl, decoration: _inputDec("Enter VIN Number")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom sticky "Continue" bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kRed,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              // TODO: Submit / Navigate
            },
            child: const Text("Continue", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }

  // Section card with red title
  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: kRed, fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// Key–Value row like the screenshot
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

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 13.5, color: Colors.black87, fontWeight: FontWeight.w600));
  }
}
