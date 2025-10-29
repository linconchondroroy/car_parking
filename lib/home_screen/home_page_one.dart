import 'package:flutter/material.dart';
// Flutter এর মূল প্যাকেজ — UI বানানোর জন্য দরকার

// মূল ক্লাস (এই পেজের নাম HomeScreenOne)
class HomeScreenOne extends StatefulWidget {
  const HomeScreenOne({super.key});

  @override
  State<HomeScreenOne> createState() => _HomeScreenOneState();
}

// এই অংশে আসল UI তৈরি হবে
class _HomeScreenOneState extends State<HomeScreenOne> {
  int _currentIndex = 0; // নিচের Bottom Navigation bar কোনটা সিলেক্টেড আছে সেটা রাখার জন্য

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Flutter এ পুরো স্ক্রিন বানানোর জন্য Scaffold ব্যবহার করা হয়
      backgroundColor: Colors.indigo.shade700, // ব্যাকগ্রাউন্ড রঙ নেভি-ব্লু

      // ----------- উপরের AppBar অংশ -----------
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade700, // AppBar এর রঙও নেভি-ব্লু
        elevation: 0, // নিচে ছায়া (shadow) থাকবে না

        // leading মানে AppBar এর বামে যা থাকে
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // চারপাশে একটু ফাঁকা জায়গা
          child: CircleAvatar( // প্রোফাইল ছবির জন্য বৃত্ত
            radius: 22, // ছবির সাইজ
            backgroundColor: Colors.transparent, // ব্যাকগ্রাউন্ড সাদা না, একদম ট্রান্সপারেন্ট
            backgroundImage: const AssetImage("assets/profile_photo.png"), // ছবির ফাইল পাথ
          ),
        ),

        // title মানে AppBar এর মাঝের অংশ
        title: Column( // নাম ও লোকেশন দুইটা একটার নিচে রাখতে Column
          crossAxisAlignment: CrossAxisAlignment.start, // সব টেক্সট বামে সাজানো
          children: const [
            Text(
              "Sabbir Ahmed", // নাম
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4), // নাম আর লোকেশনের মাঝে একটু ফাঁকা জায়গা
            Row( // লোকেশন টেক্সট আর আইকন এক লাইনে রাখার জন্য
              children: [
                Text("Bangladesh", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(width: 4),
                Icon(Icons.location_on, color: Colors.white, size: 15), // লোকেশন আইকন
              ],
            ),
          ],
        ),

        // actions মানে AppBar এর ডান পাশে আইকন
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.notifications_none, color: Colors.white), // নোটিফিকেশন আইকন
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.more_vert, color: Colors.white), // তিন ডট (মেনু) আইকন
          ),
        ],
      ),

      // ----------- মূল অংশ (Body) -----------
      body: SingleChildScrollView( // স্ক্রল করা যাবে যদি স্ক্রিন বড় হয়
        child: Padding(
          padding: const EdgeInsets.all(16.0), // চারপাশে ফাঁকা জায়গা
          child: Column( // সব কন্টেন্ট একটার নিচে একটার মতো সাজানো
            crossAxisAlignment: CrossAxisAlignment.start, // সব বামে সাজানো
            children: [
              // -------- Explore + Sort বাটন --------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // দুই প্রান্তে টেক্সট আর বাটন
                children: [
                  const Expanded( // টেক্সট যেন বাটনের সাথে লড়াই না করে জায়গা পায়
                    child: Text(
                      "Explore Parking Spots on the Map", // হেডিং টেক্সট
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon( // Sort বাটন (আইকনসহ)
                    onPressed: () {}, // এখন কিছু করবে না
                    icon: const Icon(Icons.sort), // Sort আইকন
                    label: const Text("Sort"), // টেক্সট
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // বাটন সাদা
                      foregroundColor: Colors.indigo, // টেক্সট নীল
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // বর্ডার গোল
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14), // নিচে একটু স্পেস

              // -------- Map ছবি --------
              Container(
                height: 300, // ম্যাপের উচ্চতা
                width: double.infinity, // পুরো প্রস্থ
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // ছবি গোলাকার কোণা
                  image: const DecorationImage(
                    image: AssetImage("assets/map_one.png"), // ম্যাপের ছবি
                    fit: BoxFit.cover, // পুরো বক্স ঢেকে ফেলবে
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // -------- Parking Around You + See All --------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Parking Around You", // হেডিং
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "See All", // ডান পাশে বাটনের মতো টেক্সট
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // -------- একটাই Parking Card (তুমি চাইলে কপি করে আরো বানাতে পারো) --------
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // কার্ডের ব্যাকগ্রাউন্ড
                  borderRadius: BorderRadius.circular(14), // কোণাগুলো গোল
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15), // ছায়া
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Stack( // ব্যাজ বসানোর জন্য Stack
                  children: [
                    Row( // ছবির পাশে টেক্সট রাখার জন্য
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // বাম পাশে গাড়ির ছবি
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/cars.png",
                            width: 90,
                            height: 80,
                            fit: BoxFit.cover, // ছবি পুরো জায়গা নেবে
                          ),
                        ),
                        const SizedBox(width: 12),

                        // ডান পাশে টেক্সট ইনফো
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // টাইটেল + হার্ট আইকন
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Easy Park Spot", // জায়গার নাম
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {}, // এখন কিছু করবে না
                                    icon: const Icon(Icons.favorite_border), // হার্ট আইকন
                                    color: Colors.grey,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // লোকেশন ও দূরত্ব
                              Row(
                                children: const [
                                  Icon(Icons.location_on, size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      "Las Vegas - 4.6 Km", // দূরত্ব
                                      style: TextStyle(fontSize: 13, color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              // স্লট সংখ্যা
                              Row(
                                children: const [
                                  Icon(Icons.local_parking, size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    "Available Slot: 6/12", // কতটা খালি আছে
                                    style: TextStyle(fontSize: 13, color: Colors.black54),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // দাম
                              const Text(
                                "Price: \$25/Day",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // নিচের ডান পাশে রেটিং ব্যাজ
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B), // লাল ব্যাকগ্রাউন্ড
                          borderRadius: BorderRadius.circular(20), // গোলাকার
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "4.4", // রেটিং সংখ্যা
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, size: 16, color: Colors.white), // তারকা আইকন
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12), // পরের কার্ডের আগে ফাঁকা জায়গা
            ],
          ),
        ),
      ),

      // ----------- নিচের Navigation Bar -----------
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // ব্যাকগ্রাউন্ড সাদা
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -2)),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, // কোন ট্যাব সিলেক্টেড আছে
          onTap: (i) => setState(() => _currentIndex = i), // ট্যাব চাপলে পরিবর্তন হবে
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pinkAccent, // সিলেক্টেড আইকনের রঙ
          unselectedItemColor: Colors.black54, // আনসিলেক্টেড রঙ
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: "My Reservation"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
