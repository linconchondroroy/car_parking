import 'package:flutter/material.dart';

class ParkingSpotOne extends StatefulWidget {
  const ParkingSpotOne({super.key});

  @override
  State<ParkingSpotOne> createState() => _ParkingSpotOneState();
}

class _ParkingSpotOneState extends State<ParkingSpotOne> {
  int _selectedSort = 1; // 1 = Descending, 0 = Ascending

  // Sort Popup
  Future<void> _showSortPopup(Offset globalPos) async {
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      position: RelativeRect.fromLTRB(
        globalPos.dx,
        globalPos.dy,
        overlay.size.width - globalPos.dx,
        overlay.size.height - globalPos.dy,
      ),
      items: [
        PopupMenuItem(
          enabled: false,
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
          child: const Text(
            "Sort By Price",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: Container(
            height: 1.5,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Color(0xFFE8505B),
          ),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
          child: Row(
            children: [
              const Expanded(
                child: Text("Ascending",
                    style: TextStyle(fontSize: 16, color: Colors.black87)),
              ),
              _radioDot(_selectedSort == 0),
            ],
          ),
          onTap: () => setState(() => _selectedSort = 0),
        ),
        PopupMenuItem(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 14),
          child: Row(
            children: [
              const Expanded(
                child: Text("Descending",
                    style: TextStyle(fontSize: 16, color: Colors.black87)),
              ),
              _radioDot(_selectedSort == 1),
            ],
          ),
          onTap: () => setState(() => _selectedSort = 1),
        ),
      ],
    );
  }

  static Widget _radioDot(bool selected) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xFFE8505B), width: 2.2),
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
          color: Color(0xFFE8505B),
          shape: BoxShape.circle,
        ),
      )
          : const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF23335F), // Screen background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF23335F),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "All Parking Spots",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // 🔴 Round Back Button
        leading: Padding(
          padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE8505B),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTapDown: (details) => _showSortPopup(details.globalPosition),
            child: Container(
              margin: const EdgeInsets.only(right: 14, top: 8, bottom: 8),
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Text(
                    "Sort",
                    style: TextStyle(
                      color: Color(0xFFE8505B),
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.sort, color: Color(0xFFE8505B), size: 18),
                ],
              ),
            ),
          ),
        ],
      ),

      // Body
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildParkingCard(
            title: "Easy Park Spot",
            distance: "Las Vegas - 4.6 Km",
            slots: "Available Slot: 6/12",
            price: "Price: \$25/Day",
            rating: "4.4",
          );
        },
      ),
    );
  }

  // Parking Card Widget
  Widget _buildParkingCard({
    required String title,
    required String distance,
    required String slots,
    required String price,
    required String rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/cars.png",
                  width: 90,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const Icon(Icons.favorite_border,
                            color: Colors.grey, size: 22),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            distance,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.local_parking,
                            size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          slots,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      price,
                      style: const TextStyle(
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
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFFFF6B6B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    rating,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.white, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
