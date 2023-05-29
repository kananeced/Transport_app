String? selectedIdEngin;

class ResultEngins {
  int? status;
  List<Car>? data;

  ResultEngins({this.status, this.data});

  ResultEngins.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Car>[];
      json['data'].forEach((v) {
        data!.add(Car.fromJson(v));
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

class Car {
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
  Category? category;

  Car(
      {this.id,
      this.marque,
      this.numeroplaque,
      this.couleur,
      this.model,
      this.numerochassie,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.amount,
      this.category});

  Car.fromJson(Map<String, dynamic> json) {
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
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toj() => {
        'marque': marque,
        'numeroplaque': numeroplaque,
        'couleur': couleur,
        'model': model,
        'numerochassie': numerochassie,
        'amount': amount,
        'category_id': categoryId
      };
}

class Category {
  int? id;
  String? designation;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.designation, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['designation'] = designation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
