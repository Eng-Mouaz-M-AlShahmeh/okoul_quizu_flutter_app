/* Developed by Eng Mouaz M AlShahmeh */
class UserModel {
  // String? otp;
  String? mobile;
  String? token;
  String? name;

  UserModel({
    // this.otp,
    this.mobile,
    this.token,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    // otp = json['otp'].toString();
    mobile = json['mobile'].toString();
    token = json['token'].toString();
    name = json['name'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['otp'] = otp;
    data['mobile'] = mobile;
    data['token'] = token;
    data['name'] = name;
    return data;
  }
}
