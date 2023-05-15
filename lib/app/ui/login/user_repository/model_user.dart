class ResultUser {
  int? status;
  List<User>? data;

  ResultUser({this.status, this.data});

  ResultUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
  }
}

class User {
  String? id;
  String? username;
  String? password;
  String? level;

  User({this.id, this.username, this.password, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    level = json['level'];
  }
}
