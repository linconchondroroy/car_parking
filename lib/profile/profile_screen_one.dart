import 'package:flutter/material.dart';

class ProfileScreenOne extends StatefulWidget {
  const ProfileScreenOne({super.key});

  @override
  State<ProfileScreenOne> createState() => _ProfileScreenOneState();
}

class _ProfileScreenOneState extends State<ProfileScreenOne> {
  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  int _currentIndex = 3; // Profile tab selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,

      // ───────── AppBar ─────────
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
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

      // ───────── Body ─────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/profile_photo_two.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                // Name + email + phone + edit
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Isabella Olivia",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      const Text("example@gmail.com",
                          style: TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 2),
                      const Text("Phone: 123456789132",
                          style: TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 34,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kRed,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            // TODO: navigate to edit profile
                          },
                          child: const Text("Edit Profile",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Text(
              "Account Settings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            // Settings card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  _tile(icon: Icons.lock_outline, title: "Password"),
                  _divider(),
                  _tile(icon: Icons.receipt_long_outlined, title: "Transaction History"),
                  _divider(),
                  _tile(icon: Icons.article_outlined, title: "Terms & Conditions"),
                  _divider(),
                  _tile(icon: Icons.privacy_tip_outlined, title: "Privacy Policy"),
                  _divider(),
                  _tile(icon: Icons.support_agent_outlined, title: "Contact Us"),
                  _divider(),
                  _tile(icon: Icons.delete_outline, title: "Delete Account"),
                  _divider(),
                  _tile(icon: Icons.logout_outlined, title: "Log Out"),
                ],
              ),
            ),
          ],
        ),
      ),

      // ───────── Bottom Navigation (rounded) ─────────
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kRed,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.event_note_outlined), label: "My Reservation"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }

  // ───────── Helpers ─────────
  Widget _tile({required IconData icon, required String title}) {
    return InkWell(
      onTap: () {
        // TODO: navigate
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: kRed),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.5),
              ),
            ),
            const Icon(Icons.chevron_right, color: kRed),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Divider(
    height: 1,
    thickness: 1,
    color: Colors.black12.withOpacity(.15),
    indent: 14,
    endIndent: 14,
  );
}
