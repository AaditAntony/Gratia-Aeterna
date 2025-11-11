import 'package:flutter_riverpod/legacy.dart';
import '../data/model/action_entry.dart';
import '../data/repositories/score_repository.dart';

class ScoreViewModel extends StateNotifier<int> {
  final ScoreRepository repository;

  ScoreViewModel(this.repository) : super(50) {
    _loadScore();
  }

  Future<void> _loadScore() async {
    state = await repository.loadScore();
  }

  Future<void> addAction(ActionEntry entry) async {
    if (entry.type == 'virtue') {
      state = (state + 5).clamp(0, 100);
    } else {
      state = (state - 5).clamp(0, 100);
    }
    await repository.saveScore(state);
  }
}

// Riverpod provider for global access
final scoreViewModelProvider = StateNotifierProvider<ScoreViewModel, int>((
    ref,
    ) {
  final repo = ScoreRepository();
  return ScoreViewModel(repo);
});
