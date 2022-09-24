/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizu_flutter/src/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/api.dart';

// START Mobile
class MobileNotifier extends ChangeNotifier {
  String? _mobile;
  String? get mobile => _mobile;
  void setMobile(String val) async {
    _mobile = val;
    notifyListeners();
  }
}

final mobileProvider = ChangeNotifierProvider<MobileNotifier>((ref) {
  return MobileNotifier();
});
// END Mobile

// START Name
class NameNotifier extends ChangeNotifier {
  String? _name;
  String? get name => _name;
  void setName(String val) async {
    _name = val;
    notifyListeners();
  }

  void logName(WidgetRef ref, String token) async {
    Api().postingNewUserName(token, ref.read(nameProvider.notifier).name!);
  }
}

final nameProvider = ChangeNotifierProvider<NameNotifier>((ref) {
  return NameNotifier();
});
// END Name

// START Login
class LoginNotifier extends ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get user => _user;
  Future<int> setUser(WidgetRef ref) async {
    await Api()
        .login('0${ref.read(mobileProvider.notifier).mobile!}')
        .then((value) => _user = value);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _user.token.toString());
    notifyListeners();

    if (_user.name == null) {
      return 1;
    } else {
      return 0;
    }
  }

  void getUser(WidgetRef ref, String token) async {
    Api().gettingUserInfo(token).then((value) => _user = UserModel(
          mobile: value.mobile,
          token: token,
          name: value.name,
        ));
    notifyListeners();
  }
}

final loginProvider = ChangeNotifierProvider<LoginNotifier>((ref) {
  return LoginNotifier();
});
// END Login
