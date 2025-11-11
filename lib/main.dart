import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(const ProviderScope(child: SoulJourneyApp()));
}

class SoulJourneyApp extends StatelessWidget {
  const SoulJourneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Soul Journey",
      theme: ThemeData.dark(),
      //home: const HomeScreen(),
    );
  }
}
