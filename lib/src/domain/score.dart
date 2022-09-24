/* Developed by Eng Mouaz M AlShahmeh */
class ScoreModel {
  String? name;
  int? score;
  // String? createdAt;

  ScoreModel({
    this.name,
    this.score,
    // this.createdAt,
  });

  ScoreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    score = json['score'];
    // createdAt = json['createdAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['score'] = score;
    // data['createdAt'] = createdAt;
    return data;
  }
}
