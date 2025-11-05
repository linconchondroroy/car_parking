import 'package:flutter/material.dart';

class HomeScreenFive extends StatefulWidget {
  const HomeScreenFive({super.key});

  @override
  State<HomeScreenFive> createState() => _HomeScreenFiveState();
}

class _HomeScreenFiveState extends State<HomeScreenFive> {
  // --- THEME COLORS ---
  Color get kPrimary => const Color(0xFFE8505B);
  Color get kPanel => const Color(0xFF23335F);
  Color get kCard => Colors.white;
  Color get kTextDark => const Color(0xFF222B45);
  Color get kTextLite => const Color(0xFF8A94A6);

  // --- DATES (no intl) ---
  DateTime? _startDate;
  DateTime? _endDate;

  String formatDate(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    final yyyy = d.year.toString();
    return "$mm/$dd/$yyyy";
  }

  Future<void> _pickStart() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      builder: (context, child) => _dateTheme(child),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        // if end is before start, reset end
        if (_endDate != null && _endDate!.isBefore(picked)) {
          _endDate = null;
        }
      });
    }
  }

  Future<void> _pickEnd() async {
    final base = _startDate ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? base,
      firstDate: base,
      lastDate: base.add(const Duration(days: 365)),
      builder: (context, child) => _dateTheme(child),
    );
    if (picked != null) setState(() => _endDate = picked);
  }

  Widget _dateTheme(Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
      ),
      child: child!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPanel,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // ====== HEADER (image + back) ======
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/car_row.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: _circleBtn(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            // ====== SCROLL CONTENT ======
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _infoCard(),
                    const SizedBox(height: 14),

                    _dateField(
                      label: "Select Start Date",
                      value: _startDate != null ? formatDate(_startDate!) : "mm/dd/yyyy",
                      onTap: _pickStart,
                    ),
                    const SizedBox(height: 12),

                    _dateField(
                      label: "Select End Date",
                      value: _endDate != null ? formatDate(_endDate!) : "mm/dd/yyyy",
                      onTap: _pickEnd,
                    ),
                    const SizedBox(height: 14),

                    _mapCard(),
                    const SizedBox(height: 12),

                    _rulesCard(),
                    const SizedBox(height: 12),

                    _reviewsCard(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ====== STICKY BOTTOM BUTTON ======
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          color: kPanel,
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Continue tapped")),
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

  // ========== SMALL HELPERS ==========

  Widget _circleBtn({required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimary,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  Widget _infoCard() {
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
          Text("Parking Spot Information",
              style: TextStyle(color: kPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Text("Las Vegas, NV Truck and Trailer Parking",
              style: TextStyle(color: kTextDark, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          _infoRow(Icons.location_on_outlined, "Las Vegas - 4.6 Km"),
          _infoRow(Icons.local_parking_outlined, "Available Slot: 6/12"),
          _infoRow(Icons.local_parking, "Parking Spot Type: Covered Parking"),
          const SizedBox(height: 14),
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
                    SizedBox(width: 6),
                    Icon(Icons.star, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: kTextLite, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(color: kTextDark))),
        ],
      ),
    );
  }

  Widget _dateField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(color: kPrimary, fontWeight: FontWeight.w800, fontSize: 15)),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: kCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kPrimary.withOpacity(.4), width: 1.4),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(
                      color: value.contains('/') ? kTextDark : kTextLite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(Icons.calendar_month, color: kTextLite),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _mapCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 398 / 249, // screenshot-এর কাছাকাছি অনুপাত
          child: Image.asset(
            "assets/map_one.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _rulesCard() {
    const rules = [
      "Park in designated areas only.",
      "No overnight parking.",
      "Follow the 10 km/h speed limit.",
      "Respect reserved spots.",
      "Unauthorized vehicles will be towed.",
      "Park at your own risk; management is not liable.",
      "Follow staff instructions.",
      "Keep the parking area clean.",
    ];
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
          Text("Parking Rules for Easy Park Spot",
              style: TextStyle(color: kPrimary, fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 10),
          for (final r in rules)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("•  ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(r, style: TextStyle(color: kTextDark, height: 1.4)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _reviewsCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _reviewTile(
            name: "Eleanor Summers",
            time: "Today, 16:40",
            text:
            "This app makes booking courts so much easier! The interface is simple and user-friendly. Highly recommended!",
          ),
          const Divider(height: 24),
          _reviewTile(
            name: "Eleanor Summers",
            time: "Today, 16:40",
            text:
            "This app makes booking courts so much easier! The interface is simple and user-friendly. Highly recommended!",
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("See More",
                  style: TextStyle(color: kPrimary, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewTile({
    required String name,
    required String time,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: kPrimary.withOpacity(.15),
          child: Text(name.isNotEmpty ? name[0] : '?',
              style: TextStyle(color: kPrimary, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: TextStyle(color: kTextDark, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  Text(time, style: TextStyle(color: kTextLite, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 6),
              Row(children: List.generate(5, (i) => const Icon(Icons.star, size: 14, color: Colors.amber))),
              const SizedBox(height: 8),
              Text(text, style: TextStyle(color: kTextDark, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
