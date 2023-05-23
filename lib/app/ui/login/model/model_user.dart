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
  Null? contact;
  Null? address;
  Null? sexe;
  String? compte;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.names,
      this.email,
      this.contact,
      this.address,
      this.sexe,
      this.compte,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    sexe = json['sexe'];
    compte = json['compte'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['names'] = names;
    data['email'] = email;
    data['contact'] = contact;
    data['address'] = address;
    data['sexe'] = sexe;
    data['compte'] = compte;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
