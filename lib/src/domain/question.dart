/* Developed by Eng Mouaz M AlShahmeh */
class QuestionModel {
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? correct;

  QuestionModel({
    this.question,
    this.a,
    this.b,
    this.c,
    this.d,
    this.correct,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['Question'].toString();
    a = json['a'].toString();
    b = json['b'].toString();
    c = json['c'].toString();
    d = json['d'].toString();
    correct = json['correct'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Question'] = question;
    data['a'] = a;
    data['b'] = b;
    data['c'] = c;
    data['d'] = d;
    data['correct'] = correct;
    return data;
  }
}
