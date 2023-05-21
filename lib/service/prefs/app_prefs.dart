import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static SharedPreferences? prefs;

  // static ValueNotifier<UserPerfsInfo> showUserPerf =
  //     ValueNotifier(UserPerfsInfo());

  static const String mobileUserInfo = "token";

  String? getUserInfo({String? token}) {
    prefs?.setString(
      "tokenUser",
      token!,
    );
    String? userInfo = prefs?.getString('tokenUser');

    // var json = jsonDecode(userInfo);
    return userInfo;
  }

  // void setUserInfo() {
  //   prefs?.setString(
  //     "tokenUser",
  //     token!,
  //   );
  // }
}

class UserPref {
  late String token;
  UserPref({
    required this.token,
  });

  UserPref.fromJson(Map<String, dynamic> json) {
    token = (json['token']);
  }
}
