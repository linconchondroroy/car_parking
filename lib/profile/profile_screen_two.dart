import 'package:flutter/material.dart';

class ProfileScreenTwo extends StatefulWidget {
  const ProfileScreenTwo({super.key});

  @override
  State<ProfileScreenTwo> createState() => _ProfileScreenTwoState();
}

class _ProfileScreenTwoState extends State<ProfileScreenTwo> {
  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  final _formKey = GlobalKey<FormState>();
  final _nameCtrl  = TextEditingController(text: "Isabella Olivia");
  final _emailCtrl = TextEditingController(text: "example@email.com");
  final _phoneCtrl = TextEditingController(text: "12345678910");

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint) {
    const radius = BorderRadius.all(Radius.circular(10));
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
          "Edit Profile",
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
              child:
              const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
        ),
      ),

      // Body
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 110),
          child: Column(
            children: [
              // Avatar with camera button
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white24,
                    backgroundImage:
                    const AssetImage("assets/profile_photo_two.png"),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 6,
                    child: InkWell(
                      onTap: () {
                        // TODO: pick image
                      },
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kRed, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt_outlined,
                            size: 18, color: kRed),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // White card with fields
              Container(
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
                        "Personal Information",
                        style: TextStyle(
                            color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(height: 14),

                      const _FieldLabel("Full Name"),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: _dec("Full Name"),
                        validator: (v) =>
                        (v == null || v.trim().isEmpty) ? "Required" : null,
                      ),

                      const SizedBox(height: 14),
                      const _FieldLabel("Email"),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: _dec("Email"),
                        validator: (v) {
                          if (v == null || v.isEmpty) return "Required";
                          final ok = RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+$").hasMatch(v);
                          return ok ? null : "Invalid email";
                        },
                      ),

                      const SizedBox(height: 14),
                      const _FieldLabel("Phone Number"),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _phoneCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: _dec("Phone Number"),
                        validator: (v) =>
                        (v == null || v.trim().isEmpty) ? "Required" : null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Save button
      bottomNavigationBar: Container
        (
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
                // TODO: Save action / API
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile saved")),
                );
              }
            },
            child: const Text("Save"),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 13.5, color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }
}
