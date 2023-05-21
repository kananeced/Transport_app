class ResultUsers {
  int? status;
  List<Users>? data;

  ResultUsers({this.status, this.data});

  ResultUsers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Users>[];
      json['data'].forEach((v) {
        data!.add(Users.fromJson(v));
      });
    }
  }
}

class Users {
  String? id;
  String? username;
  String? password;
  String? level;

  Users({this.id, this.username, this.password, this.level});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    level = json['level'];
  }
}
