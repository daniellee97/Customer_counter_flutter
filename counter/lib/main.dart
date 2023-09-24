import 'package:flutter/material.dart';
import 'screens/counterScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Counter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const CounterScreen(title: 'Customer Counter'),
    );
  }
}
