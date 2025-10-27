import 'package:car_parking/authentication_screen/verify_otp.dart';
import 'package:flutter/material.dart';

class sing_up extends StatefulWidget {
  const sing_up({super.key});

  @override
  State<sing_up> createState() => _sing_upState();
}

class _sing_upState extends State<sing_up> {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Regex
  static RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');
  static RegExp nameRegExp = RegExp(r'^[a-zA-Z ]+$');
  static RegExp emailRegExp =
  RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "User Name is required";
    } else if (!nameRegExp.hasMatch(value)) {
      return "Only letters are allowed";
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    } else if (!passRegExp.hasMatch(value)) {
      return "Password must contain letters and numbers";
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    } else if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Validation passed → navigate to OTP screen
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const verify_otp()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700,
      ),
      backgroundColor: Colors.indigo.shade700,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/sing_up.png"),
                const SizedBox(height: 10),

                // User Name
                TextFormField(
                  controller: _userNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  validator: _nameValidator,
                ),
                const SizedBox(height: 5),

                // Email
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    hintText: "@example.com",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.check_box, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  validator: _emailValidator,
                ),
                const SizedBox(height: 5),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon:
                    Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  validator: _passwordValidator,
                ),
                const SizedBox(height: 5),

                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon:
                    Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                  validator: _confirmPasswordValidator,
                ),
                const SizedBox(height: 10),

                // Sign Up Button
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: InkWell(
                    onTap: _signUp,
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
