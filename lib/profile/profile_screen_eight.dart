import 'package:flutter/material.dart';

class ProfileScreenEight extends StatefulWidget {
  const ProfileScreenEight({super.key});

  @override
  State<ProfileScreenEight> createState() => _ProfileScreenEightState();
}

class _ProfileScreenEightState extends State<ProfileScreenEight> {
  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  final _formKey   = GlobalKey<FormState>();
  final _nameCtrl  = TextEditingController(text: "Isabella Olivia");
  final _emailCtrl = TextEditingController(text: "example@email.com");
  final _subCtrl   = TextEditingController();
  final _fbCtrl    = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subCtrl.dispose();
    _fbCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {int lines = 1}) {
    const radius = BorderRadius.all(Radius.circular(10));
    return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: lines > 1 ? 12 : 14,
      ),
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
          "Contact Us",
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
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 110),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact With Admin",
                    style: TextStyle(
                        color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 14),

                  const _Lbl("Full Name"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: _dec("Enter full name"),
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Required" : null,
                  ),

                  const SizedBox(height: 14),
                  const _Lbl("Email"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _dec("Enter email"),
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Required";
                      final ok = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(v);
                      return ok ? null : "Invalid email";
                    },
                  ),

                  const SizedBox(height: 14),
                  const _Lbl("Subject"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _subCtrl,
                    decoration: _dec("Write Your Subject"),
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Required" : null,
                  ),

                  const SizedBox(height: 14),
                  const _Lbl("Feedback"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _fbCtrl,
                    maxLines: 6,
                    decoration: _dec("Write Your Feedback Here", lines: 6),
                    validator: (v) =>
                    (v == null || v.trim().isEmpty) ? "Required" : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Bottom Submit
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
        color: Colors.transparent,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kRed,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // TODO: API or email send
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Message submitted")),
                );
                Navigator.pop(context);
              }
            },
            child: const Text("Submit"),
          ),
        ),
      ),
    );
  }
}

class _Lbl extends StatelessWidget {
  final String text;
  const _Lbl(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 13.5, color: Colors.black87, fontWeight: FontWeight.w600));
  }
}
