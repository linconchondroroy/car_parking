import 'package:flutter/material.dart';

class FavoriteScreenFour extends StatefulWidget {
  const FavoriteScreenFour({super.key});

  @override
  State<FavoriteScreenFour> createState() => _FavoriteScreenFourState();
}

class _FavoriteScreenFourState extends State<FavoriteScreenFour> {
  // Colors
  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  // Form state
  final _formKey = GlobalKey<FormState>();
  String? _billingType;
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _checkIn;
  final _slotCtrl = TextEditingController();

  @override
  void dispose() {
    _slotCtrl.dispose();
    super.dispose();
  }

  // Common input decoration (red borders)
  InputDecoration _decoration(String hint, {Widget? suffixIcon}) {
    const radius = BorderRadius.all(Radius.circular(10));
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      suffixIcon: suffixIcon,
      enabledBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: kRed, width: 1.2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: kRed, width: 1.6),
      ),
    );
  }

  // Helpers to format date/time without any package
  String _fmtDate(DateTime? d) =>
      d == null ? "mm/dd/yyyy" : "${d.month.toString().padLeft(2,'0')}/${d.day.toString().padLeft(2,'0')}/${d.year}";
  String _fmtTime(TimeOfDay? t) =>
      t == null ? "08:00" : "${t.hour.toString().padLeft(2,'0')}:${t.minute.toString().padLeft(2,'0')}";

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

      // Body
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 110),
          child: Column(
            children: [
              // ───── Parking Spot Information card ─────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Parking Spot Information",
                          style: TextStyle(
                              color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Las Vegas, NV Truck and Trailer Parking",
                          style: TextStyle(fontSize: 13.5, color: Colors.black87),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    // body rows
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _RowIconText(
                            icon: Icons.location_on,
                            text: "Las Vegas - 4.6 Km",
                          ),
                          SizedBox(height: 10),
                          _PriceRow(day: "\$25/Day", week: "\$100/Week"),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                    // rating badge
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Text("4.4",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Icon(Icons.star, size: 14, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ───── Billing Information card ─────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Billing Information",
                        style: TextStyle(
                            color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(height: 14),

                      // Billing type
                      const _FieldLabel("Billing Type"),
                      const SizedBox(height: 6),
                      DropdownButtonFormField<String>(
                        value: _billingType,
                        items: const [
                          DropdownMenuItem(value: "Day/Weekly", child: Text("Day/Weekly")),
                          DropdownMenuItem(value: "Daily", child: Text("Daily")),
                          DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
                        ],
                        onChanged: (v) => setState(() => _billingType = v),
                        decoration: _decoration("Day/Weekly",
                            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.black54)),
                      ),

                      const SizedBox(height: 14),

                      // Start date
                      const _FieldLabel("Select Start Date"),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () async {
                          final now = DateTime.now();
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _startDate ?? now,
                            firstDate: DateTime(now.year - 1),
                            lastDate: DateTime(now.year + 2),
                          );
                          if (picked != null) setState(() => _startDate = picked);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            decoration: _decoration(_fmtDate(_startDate),
                                suffixIcon: const Icon(Icons.calendar_today_rounded,
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // End date
                      const _FieldLabel("Select End Date"),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () async {
                          final base = _startDate ?? DateTime.now();
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: _endDate ?? base,
                            firstDate: DateTime(base.year - 1),
                            lastDate: DateTime(base.year + 2),
                          );
                          if (picked != null) setState(() => _endDate = picked);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            decoration: _decoration(_fmtDate(_endDate),
                                suffixIcon: const Icon(Icons.calendar_today_rounded,
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Check-in time
                      const _FieldLabel("Expected Check-in Time"),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: _checkIn ?? const TimeOfDay(hour: 8, minute: 0),
                          );
                          if (picked != null) setState(() => _checkIn = picked);
                        },
                        child: IgnorePointer(
                          child: TextFormField(
                            decoration: _decoration(_fmtTime(_checkIn),
                                suffixIcon: const Icon(Icons.access_time_rounded,
                                    color: Colors.redAccent)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Slot
                      const _FieldLabel("Enter Your Slot (6/12)"),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _slotCtrl,
                        keyboardType: TextInputType.number,
                        decoration: _decoration("Enter Your Slot",
                            suffixIcon: const Icon(Icons.receipt_long_outlined,
                                color: Colors.redAccent)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom sticky Continue
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
              // TODO: validation / next navigation
              // if (_formKey.currentState?.validate() ?? false) { ... }
            },
            child: const Text("Continue", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

/// Small grey label style
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

/// Icon + text line used under Parking Spot info
class _RowIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const _RowIconText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 6),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.black54))),
      ],
    );
  }
}

/// Price row ("Price: $25/Day   Price: $100/Week")
class _PriceRow extends StatelessWidget {
  final String day;
  final String week;
  const _PriceRow({required this.day, required this.week});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 6,
      children: [
        Text("Price: $day",
            style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
        Text("Price: $week",
            style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
      ],
    );
  }
}
