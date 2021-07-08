import 'package:events_app_flutter/screens/home-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EventsApp());
}

class EventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
