import 'package:flutter/material.dart';

class NotificationsScreenOne extends StatelessWidget {
  const NotificationsScreenOne({super.key});

  static const Color kBg  = Color(0xFF23335F);
  static const Color kRed = Color(0xFFE8505B);

  @override
  Widget build(BuildContext context) {
    final items = <_Notif>[
      _Notif(
        title: "Successful!",
        body: "A payment of \$20 has been made for the haircut.",
        time: "1 h",
        isRead: true,
      ),
      _Notif(
        title: "Congratulations!",
        body: "A payment of \$60 has been made for the haircut.",
        time: "1 h",
        isRead: true,
      ),
      _Notif(
        title: "Best offer for you!",
        body: "It is a long established fact.",
        time: "1 h",
        isRead: true,
      ),
      _Notif(
        title: "Best offer for you!",
        body: "It is a long established fact.",
        time: "1 h",
        isRead: false, // unread → বাম পাশে ডট দেখাবে
      ),
    ];

    return Scaffold(
      backgroundColor: kBg,

      // AppBar
      appBar: AppBar(
        backgroundColor: kBg,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notification",
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
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 24),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) => _NotificationTile(data: items[i]),
      ),
    );
  }
}

/// Single notification card (screenshot-স্টাইল)
class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.data});
  final _Notif data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar / Unread dot
          data.isRead
              ? CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFFFFDDE3),
            child: Icon(Icons.person, color: Colors.red.shade400, size: 18),
          )
              : Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(left: 4, right: 12, top: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),

          if (data.isRead) const SizedBox(width: 12),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.body,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          // Time
          const SizedBox(width: 8),
          Text(
            data.time,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Notif {
  final String title;
  final String body;
  final String time;
  final bool isRead;
  const _Notif({
    required this.title,
    required this.body,
    required this.time,
    required this.isRead,
  });
}
