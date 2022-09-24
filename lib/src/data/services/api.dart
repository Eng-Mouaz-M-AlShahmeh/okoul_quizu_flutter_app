/* Developed by Eng Mouaz M AlShahmeh */
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizu_flutter/src/domain/question.dart';
import 'package:quizu_flutter/src/domain/score.dart';
import 'package:quizu_flutter/src/domain/user.dart';
import '../../presentation/utils/constants.dart';

class Api {
  String baseURL = Constants.apiBaseUrl;

  // void tokenVerification() async {
  //   var request = http.Request('GET', Uri.parse('$baseURL/Token'));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  Future<UserModel> login(String mobile) async {
    Uri? url = Uri.tryParse('$baseURL/Login');
    var response = await http.post(url!, headers: {}, body: {
      "OTP": "0000",
      "mobile": mobile,
    });
    if (response.statusCode == 201) {
      dynamic jsonx = json.decode(response.body);
      UserModel user;
      user = UserModel.fromJson(jsonx);
      return user;
    } else {
      throw Exception('Can\'t login user');
    }
  }

  void postingNewUserName(String token, String name) async {
    Uri? url = Uri.tryParse('$baseURL/Name');
    var response = await http.post(url!, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      "name": name
    });
    if (response.statusCode == 201) {
      dynamic jsonx = json.decode(response.body);
      print(jsonx);
      return;
    } else {
      throw Exception('Can\'t post username');
    }
  }

  Future<List<ScoreModel>> top10Scores(String token) async {
    Uri? url = Uri.tryParse('$baseURL/TopScores');
    var response =
        await http.get(url!, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      dynamic jsonx = json.decode(response.body);
      List<ScoreModel> scores = [];
      for (int i = 0; i < jsonx.length; i++) {
        scores.add(ScoreModel.fromJson(jsonx[i]));
      }
      return scores;
    } else {
      throw Exception('Can\'t get scores');
    }
  }

  Future<UserModel> gettingUserInfo(String token) async {
    Uri? url = Uri.tryParse('$baseURL/UserInfo');
    var response =
        await http.get(url!, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      dynamic jsonx = json.decode(response.body);
      UserModel user = UserModel();
      user = UserModel.fromJson(jsonx);
      return user;
    } else {
      throw Exception('Can\'t get user');
    }
  }

  Future<List<QuestionModel>> gettingQuestions(String token) async {
    Uri? url = Uri.tryParse('$baseURL/Questions');
    var response =
        await http.get(url!, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      dynamic jsonx = json.decode(response.body);
      List<QuestionModel> questions = [];
      for (int i = 0; i < jsonx.length; i++) {
        questions.add(QuestionModel.fromJson(jsonx[i]));
      }
      return questions;
    } else {
      throw Exception('Can\'t get questions');
    }
  }

  // void userScore(String score) async {
  //   var request = http.Request('POST', Uri.parse('$baseURL/Score'));
  //   request.body = '''{\n "score":"$score" \n}''';
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
