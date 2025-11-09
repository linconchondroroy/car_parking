import 'package:flutter/material.dart';

class ProfileScreenThree extends StatefulWidget {
  const ProfileScreenThree({super.key});

  @override
  State<ProfileScreenThree> createState() => _ProfileScreenThreeState();
}

class _ProfileScreenThreeState extends State<ProfileScreenThree> {
  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  final _formKey = GlobalKey<FormState>();
  final _oldCtrl = TextEditingController();
  final _newCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obOld = true, _obNew = true, _obConfirm = true;

  @override
  void dispose() {
    _oldCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {bool obscure = true, VoidCallback? toggle}) {
    const radius = BorderRadius.all(Radius.circular(10));
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      suffixIcon: toggle == null
          ? null
          : IconButton(
        onPressed: toggle,
        icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.black54),
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

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    // TODO: call change password API
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully')),
    );
    Navigator.pop(context);
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
          "Password",
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
                    "Change Password",
                    style: TextStyle(
                        color: kRed, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 14),

                  // Old
                  const _Label("Old Password"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _oldCtrl,
                    obscureText: _obOld,
                    decoration: _dec("Enter Old Password",
                        toggle: () => setState(() => _obOld = !_obOld)),
                    validator: (v) =>
                    (v == null || v.isEmpty) ? "Required" : null,
                  ),

                  const SizedBox(height: 14),

                  // New
                  const _Label("New Password"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _newCtrl,
                    obscureText: _obNew,
                    decoration: _dec("Enter New Password",
                        toggle: () => setState(() => _obNew = !_obNew)),
                    validator: (v) {
                      if (v == null || v.isEmpty) return "Required";
                      if (v.length < 6) return "At least 6 characters";
                      return null;
                    },
                  ),

                  const SizedBox(height: 14),

                  // Confirm
                  const _Label("Confirm Password"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _confirmCtrl,
                    obscureText: _obConfirm,
                    decoration: _dec("Enter Confirm Password",
                        toggle: () => setState(() => _obConfirm = !_obConfirm)),
                    validator: (v) =>
                    (v != _newCtrl.text) ? "Password doesn't match" : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Bottom Save button
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
            onPressed: _save,
            child: const Text("Save"),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 13.5, color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }
}
