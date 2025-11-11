import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/model/action_entry.dart';
import '../view-model/score_view_model.dart';

class AddActionScreen extends ConsumerStatefulWidget {
  final String type;
  const AddActionScreen({super.key, required this.type});

  @override
  ConsumerState<AddActionScreen> createState() => _AddActionScreenState();
}

class _AddActionScreenState extends ConsumerState<AddActionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isVirtue = widget.type == 'virtue';
    return Scaffold(
      appBar: AppBar(
        title: Text(isVirtue ? "Add Virtue" : "Add Sin"),
        backgroundColor: isVirtue ? Colors.green : Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Describe your action",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isVirtue ? Colors.green : Colors.red,
              ),
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  final entry = ActionEntry(
                    type: widget.type,
                    description: _controller.text,
                    date: DateTime.now(),
                  );
                  await ref
                      .read(scoreViewModelProvider.notifier)
                      .addAction(entry);
                  Navigator.pop(context);
                }
              },
              child: Text(isVirtue ? "Add Virtue" : "Add Sin"),
            ),
          ],
        ),
      ),
    );
  }
}
