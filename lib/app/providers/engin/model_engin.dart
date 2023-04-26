class ResultEngin {
  List<Car>? data;

  ResultEngin({this.data});

  ResultEngin.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Car>[];
      json['data'].forEach((v) {
        data!.add(Car.fromJson(v));
      });
    }
  }
}

class Car {
  String? id;
  String? marque;
  String? nemeroplaque;
  String? couleur;
  String? model;
  String? numerochassie;
  String? categorieId;
  String? designation;

  Car(
      {this.id,
      this.marque,
      this.nemeroplaque,
      this.couleur,
      this.model,
      this.numerochassie,
      this.categorieId,
      this.designation});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marque = json['marque'];
    nemeroplaque = json['nemeroplaque'];
    couleur = json['couleur'];
    model = json['model'];
    numerochassie = json['numerochassie'];
    categorieId = json['categorie_id'];
    designation = json['designation'];
  }
}
