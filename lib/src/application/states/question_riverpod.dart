/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizu_flutter/src/data/services/api.dart';
import 'package:quizu_flutter/src/domain/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

// START Questions
final questionListProvider =
    FutureProvider.autoDispose<List<QuestionModel>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  String? sharedToken = prefs.getString('token');
  if (sharedToken != null) {
    return Api().gettingQuestions(sharedToken);
  } else {
    throw Exception('Can\'t get questions');
  }
});
// END Questions

// START Questions
class QuestionStepNotifier extends ChangeNotifier {
  int _step = 0;
  int get step => _step;

  void setStep(int val) {
    _step = val;
    notifyListeners();
  }
}

final stepProvider = ChangeNotifierProvider<QuestionStepNotifier>((ref) {
  return QuestionStepNotifier();
});
// END Questions
