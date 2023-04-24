class ResultEngin {
  List<Engin>? data;

  ResultEngin({this.data});

  ResultEngin.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Engin>[];
      json['data'].forEach((v) {
        data!.add(Engin.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Engin {
  String? id;
  String? marque;
  String? nemeroplaque;
  String? couleur;
  String? model;
  String? numerochassie;
  String? categorieId;

  Engin(
      {this.id,
      this.marque,
      this.nemeroplaque,
      this.couleur,
      this.model,
      this.numerochassie,
      this.categorieId});

  Engin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marque = json['marque'];
    nemeroplaque = json['nemeroplaque'];
    couleur = json['couleur'];
    model = json['model'];
    numerochassie = json['numerochassie'];
    categorieId = json['categorie_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['marque'] = marque;
    data['nemeroplaque'] = nemeroplaque;
    data['couleur'] = couleur;
    data['model'] = model;
    data['numerochassie'] = numerochassie;
    data['categorie_id'] = categorieId;
    return data;
  }
}
