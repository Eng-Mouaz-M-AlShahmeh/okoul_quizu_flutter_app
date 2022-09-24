/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizu_flutter/src/data/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/score.dart';

// START Scores List
final scoreListProvider =
    FutureProvider.autoDispose<List<ScoreModel>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  String? sharedToken = prefs.getString('token');
  if (sharedToken != null) {
    return Api().top10Scores(sharedToken);
  }
  return [];
});
// END Scores List

// START Score Result
class ScoreNotifier extends ChangeNotifier {
  int _score = 0;
  int get score => _score;

  void setScore(int val) {
    _score = val;
    notifyListeners();
  }
}

final scoreProvider = ChangeNotifierProvider<ScoreNotifier>((ref) {
  return ScoreNotifier();
});
// END Score Result
