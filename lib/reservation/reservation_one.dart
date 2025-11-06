import 'package:flutter/material.dart';

class ReservationScreenOne extends StatefulWidget {
  const ReservationScreenOne({super.key});

  @override
  State<ReservationScreenOne> createState() =>
      _CompletedReservationScreenState();
}

class _CompletedReservationScreenState
    extends State<ReservationScreenOne> with TickerProviderStateMixin {
  static const Color kBg = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2, // Completed tab selected
      length: 3,
      child: Scaffold(
        backgroundColor: kBg,

        // ─────────── AppBar ───────────
        appBar: AppBar(
          backgroundColor: kBg,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Completed Reservation",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: const BoxDecoration(color: kRed, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 18),
              ),
            ),
          ),
        ),

        // ─────────── Body ───────────
        body: Column(
          children: [
            // Top Tabs inside rounded white container
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TabBar(
                  indicatorColor: kRed,
                  labelColor: kRed,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  tabs: [
                    Tab(text: "Upcoming"),
                    Tab(text: "Running"),
                    Tab(text: "Completed"),
                  ],
                ),
              ),
            ),

            // Tab contents
            Expanded(
              child: TabBarView(
                children: [
                  _emptyTab(text: "No upcoming reservations"),
                  _emptyTab(text: "No running reservations"),
                  _completedList(), // Completed
                ],
              ),
            ),
          ],
        ),

        // ─────────── Bottom Nav (rounded white top) ───────────
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event_note_outlined), label: "My Reservation"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────── Completed tab list ───────────
  Widget _completedList() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/cars.png",
                  width: 105,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Easy Park Spot",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.location_on, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "Las Vegas - 4.6 Km",
                            style: TextStyle(fontSize: 13, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.local_parking, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          "Slot Book: 5",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Submit Review Button (outlined red)
              const SizedBox(width: 8),
              _outlineRedButton(
                text: "Submit Your Review",
                onTap: () {
                  // TODO: navigate to review screen
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Outlined red button widget
  Widget _outlineRedButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kRed, width: 1.5),
          color: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: kRed, fontWeight: FontWeight.w600, fontSize: 12.5),
        ),
      ),
    );
  }

  // Empty placeholders for other tabs
  static Widget _emptyTab({required String text}) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
