import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static SharedPreferences? prefs;

  // static ValueNotifier<UserPerfsInfo> showUserPerf =
  //     ValueNotifier(UserPerfsInfo());

  static const String mobileUserInfo = "token";
}

UserPref getUserInfo() {
  var userInfo = AppPref.prefs?.getString(AppPref.mobileUserInfo) ?? '';

  if (userInfo.isEmpty) {
    return UserPref(token: "", userPerfsInfo: UserPrefInfo());
  } else {
    var json = jsonDecode(userInfo);
    return UserPref.fromJson(json);
  }
}

void setUserInfo(UserPref userInfo) {
  AppPref.prefs?.setString(
    AppPref.mobileUserInfo,
    jsonEncode(
      userInfo.toJson(),
    ),
  );
}

class UserPref {
  String? token;
  UserPrefInfo? userPerfsInfo;

  UserPref({this.token, this.userPerfsInfo});

  UserPref.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userPerfsInfo = json['userPerfsInfo'] != null
        ? UserPrefInfo.fromJson(json['userPerfsInfo'])
        : null;
  }

  toJson() => {
        "token": token,
        "userPerfsInfo": userPerfsInfo?.toJson(),
      };
}

class UserPrefInfo {
  int? id;
  String? names;
  String? email;

  String? compte;

  UserPrefInfo({
    this.id,
    this.names,
    this.email,
    this.compte,
  });

  UserPrefInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    email = json['email'];

    compte = json['compte'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['names'] = names;
    data['email'] = email;

    data['compte'] = compte;

    return data;
  }
}
