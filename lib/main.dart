import 'package:flutter/material.dart';
import 'package:weekly_scheduler/schedule_screen.dart';

import 'landing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}


