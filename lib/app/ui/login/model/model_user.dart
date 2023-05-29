class ResultUser {
  bool? status;
  User? user;
  String? message;
  String? token;

  ResultUser({this.status, this.user, this.message, this.token});

  ResultUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? names;
  String? email;

  String? compte;

  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.names,
      this.email,
      this.compte,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    email = json['email'];

    compte = json['compte'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['names'] = names;
    data['email'] = email;

    data['compte'] = compte;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
