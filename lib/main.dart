import 'package:flutter/material.dart';

void main() {
  runApp(const SoulJourneyApp());
}

class SoulJourneyApp extends StatelessWidget {
  const SoulJourneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gratia Aetrna",
      theme: ThemeData.dark(),
    );
  }
}
