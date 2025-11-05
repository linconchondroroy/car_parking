import 'package:flutter/material.dart';

class HomeScreenEight extends StatefulWidget {
  const HomeScreenEight({super.key});

  @override
  State<HomeScreenEight> createState() => _HomeScreenEightState();
}

class _HomeScreenEightState extends State<HomeScreenEight> {
  // THEME
  final Color kPrimary = const Color(0xFFE8505B);
  final Color kBg = const Color(0xFF23335F);
  final Color kCard = Colors.white;
  final Color kTextDark = const Color(0xFF1E2A3B);
  final Color kTextLite = const Color(0xFF8A94A6);

  // ---------- BILLING (summary style like screenshot) ----------
  String billingType = "Day";
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay checkIn = const TimeOfDay(hour: 8, minute: 0);
  int parkingSlot = 2;

  // ---------- VEHICLE FORM ----------
  final _formKey = GlobalKey<FormState>();
  String? vehicleKind; // Car/Truck
  String? carType;     // Personal/Company
  final makeCtrl = TextEditingController();
  final modelCtrl = TextEditingController();
  final plateCtrl = TextEditingController();
  final vinCtrl = TextEditingController();

  // helpers
  String _formatLong(DateTime d) {
    const months = [
      'January','February','March','April','May','June',
      'July','August','September','October','November','December'
    ];
    return "${months[d.month - 1]} ${d.day}, ${d.year}";
  }

  Future<void> _pickStart() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (c, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        startDate = picked;
        if (endDate != null && endDate!.isBefore(picked)) endDate = null;
      });
    }
  }

  Future<void> _pickEnd() async {
    final base = startDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? base,
      firstDate: base,
      lastDate: base.add(const Duration(days: 365)),
      builder: (c, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => endDate = picked);
  }

  Future<void> _pickTime() async {
    final t = await showTimePicker(
      context: context,
      initialTime: checkIn,
      builder: (c, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        ),
        child: child!,
      ),
    );
    if (t != null) setState(() => checkIn = t);
  }

  @override
  void dispose() {
    makeCtrl.dispose();
    modelCtrl.dispose();
    plateCtrl.dispose();
    vinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Stack(
          children: [
            // SCROLL CONTENT
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 70, 16, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _billingCard(),
                  const SizedBox(height: 16),
                  _vehicleCard(),
                ],
              ),
            ),

            // TOP BAR (back + centered title)
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
                        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM CTA
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          color: kBg,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Continue")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Continue",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }

  // ---------- CARDS ----------

  Widget _billingCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Billing Information",
              style: TextStyle(color: kPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: 12),

          // Summary rows (like screenshot). Each value is tappable to edit.
          _kv("Billing Type", billingType),
          const SizedBox(height: 6),
          _kv("Start Date",
              startDate != null ? _formatLong(startDate!) : "Tap to select",
              onTap: _pickStart),
          const SizedBox(height: 6),
          _kv("End Date",
              endDate != null ? _formatLong(endDate!) : "Tap to select",
              onTap: _pickEnd),
          const SizedBox(height: 6),
          _kv("Check-in Time", checkIn.format(context), onTap: _pickTime),
          const SizedBox(height: 6),
          _kv("Parking Slot", "$parkingSlot Slot"),
          const SizedBox(height: 12),

          // Inline quick-edit row (optional)
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: _fieldDeco(),
                  value: billingType,
                  items: const [
                    DropdownMenuItem(value: "Day", child: Text("Day")),
                    DropdownMenuItem(value: "Week", child: Text("Week")),
                    DropdownMenuItem(value: "Month", child: Text("Month")),
                  ],
                  onChanged: (v) => setState(() => billingType = v ?? "Day"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  decoration: _fieldDeco().copyWith(
                    hintText: "Slots",
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: parkingSlot.toString(),
                  onChanged: (v) {
                    final n = int.tryParse(v);
                    if (n != null) setState(() => parkingSlot = n);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _vehicleCard() {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Vehicles Information",
                style: TextStyle(color: kPrimary, fontWeight: FontWeight.w700, fontSize: 16)),
            const SizedBox(height: 14),

            _label("Select Vehicles"),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: _fieldDeco(),
              value: vehicleKind,
              items: const [
                DropdownMenuItem(value: "Car", child: Text("Car/Truck")),
                DropdownMenuItem(value: "Bike", child: Text("Bike")),
                DropdownMenuItem(value: "Truck", child: Text("Truck")),
              ],
              onChanged: (v) => setState(() => vehicleKind = v),
              validator: (v) => v == null ? "Select vehicle type" : null,
            ),
            const SizedBox(height: 14),

            _label("Car Type"),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              decoration: _fieldDeco(),
              value: carType,
              items: const [
                DropdownMenuItem(value: "Personal", child: Text("Personal/Company")),
                DropdownMenuItem(value: "Company", child: Text("Company")),
              ],
              onChanged: (v) => setState(() => carType = v),
              validator: (v) => v == null ? "Select car type" : null,
            ),
            const SizedBox(height: 14),

            _label("Car Make"),
            const SizedBox(height: 6),
            TextFormField(
              controller: makeCtrl,
              decoration: _fieldDeco().copyWith(hintText: "Type Here"),
              validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
            ),
            const SizedBox(height: 14),

            _label("Car Model"),
            const SizedBox(height: 6),
            TextFormField(
              controller: modelCtrl,
              decoration: _fieldDeco().copyWith(hintText: "Type Here"),
              validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
            ),
            const SizedBox(height: 14),

            _label("Car Number Plate"),
            const SizedBox(height: 6),
            TextFormField(
              controller: plateCtrl,
              decoration: _fieldDeco().copyWith(hintText: "license plate number"),
              validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
            ),
            const SizedBox(height: 14),

            _label("Car VIN"),
            const SizedBox(height: 6),
            TextFormField(
              controller: vinCtrl,
              decoration: _fieldDeco().copyWith(hintText: "Enter VIN Number"),
              validator: (v) => (v == null || v.isEmpty) ? "Required" : null,
            ),
          ],
        ),
      ),
    );
  }

  // ---------- SMALL UI HELPERS ----------

  Widget _kv(String k, String v, {VoidCallback? onTap}) {
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$k: ",
            style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700)),
        Expanded(
          child: Text(v, style: TextStyle(color: kTextDark)),
        ),
      ],
    );
    if (onTap == null) return row;
    return InkWell(
      onTap: onTap,
      child: row,
    );
  }

  InputDecoration _fieldDeco() {
    return InputDecoration(
      hintStyle: TextStyle(color: kTextLite),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimary.withOpacity(.6), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kPrimary, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700),
  );
}
