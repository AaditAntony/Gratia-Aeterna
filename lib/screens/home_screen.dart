import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gratia_aeterna/screens/progress_bar.dart';
import '../view-model/score_view_model.dart';
import 'add_action_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scoreViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Soul Journey"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressBar(value: score / 100),
          const SizedBox(height: 20),
          Text(
            "Your Spiritual Score: $score",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_upward),
                label: const Text("Add Virtue"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddActionScreen(type: 'virtue'),
                    ),
                  );
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_downward),
                label: const Text("Add Sin"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddActionScreen(type: 'sin'),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
