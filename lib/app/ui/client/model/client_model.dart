class ResultClient {
  int? status;
  List<Client>? data;

  ResultClient({this.status, this.data});

  ResultClient.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Client>[];
      json['data'].forEach((v) {
        data!.add(Client.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Client {
  int? id;
  String? names;
  String? email;
  String? contact;
  String? address;
  String? sexe;
  String? compte;

  String? createdAt;
  String? updatedAt;
  List<Payments>? payments;

  Client(
      {this.id,
      this.names,
      this.email,
      this.contact,
      this.address,
      this.sexe,
      this.compte,
      this.createdAt,
      this.updatedAt,
      this.payments});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    sexe = json['sexe'];
    compte = json['compte'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
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

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  int? id;
  String? amount;
  int? userId;
  int? enginId;
  String? createdAt;
  String? updatedAt;
  Engins? engins;

  Payments(
      {this.id,
      this.amount,
      this.userId,
      this.enginId,
      this.createdAt,
      this.updatedAt,
      this.engins});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    userId = json['user_id'];
    enginId = json['engin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    engins = json['engins'] != null ? Engins.fromJson(json['engins']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['amount'] = amount;
    data['user_id'] = userId;
    data['engin_id'] = enginId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (engins != null) {
      data['engins'] = engins!.toJson();
    }
    return data;
  }
}

class Engins {
  int? id;
  String? marque;
  String? numeroplaque;
  String? couleur;
  String? model;
  String? numerochassie;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  String? amount;

  Engins(
      {this.id,
      this.marque,
      this.numeroplaque,
      this.couleur,
      this.model,
      this.numerochassie,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.amount});

  Engins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marque = json['marque'];
    numeroplaque = json['numeroplaque'];
    couleur = json['couleur'];
    model = json['model'];
    numerochassie = json['numerochassie'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['marque'] = marque;
    data['numeroplaque'] = numeroplaque;
    data['couleur'] = couleur;
    data['model'] = model;
    data['numerochassie'] = numerochassie;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['amount'] = amount;
    return data;
  }
}
