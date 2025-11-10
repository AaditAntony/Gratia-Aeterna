import 'package:gratia_aeterna/core/local_storage.dart';

class ScoreRepository{
  static const String scoreKey='score';

  Future<int>loadScore()async{
return await LocalStorage.getInt(scoreKey, 50);
  }

  Future<void>saveScoe(int score)async{
    return await LocalStorage.saveInt(scoreKey, score);
  }
}