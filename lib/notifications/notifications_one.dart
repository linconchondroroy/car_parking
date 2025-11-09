import 'package:flutter/material.dart';

class NotificationsScreenOne extends StatefulWidget {
  const NotificationsScreenOne({super.key});

  @override
  State<NotificationsScreenOne> createState() => _NotificationsScreenOneState();
}

class _NotificationsScreenOneState extends State<NotificationsScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Notification",
          style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
