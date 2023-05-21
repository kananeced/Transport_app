import 'package:flutter/cupertino.dart';
import 'package:transport_app/app/ui/engin/model/model_engin.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';

class EnginController {
  String? categorie;
  TextEditingController? marque;
  TextEditingController? model;
  String couleurs = "Jaune";
  TextEditingController? numerochassie;
  TextEditingController? nemeroplaque;

  EnginController() {
    marque = TextEditingController();
    model = TextEditingController();
    numerochassie = TextEditingController();
    nemeroplaque = TextEditingController();
  }

  bool get validation =>
      marque!.text.trim().isNotEmpty &&
      model!.text.trim().isNotEmpty &&
      numerochassie!.text.trim().isNotEmpty &&
      nemeroplaque!.text.trim().isNotEmpty;

  void submitPostEngin(AppBloc? bloc) {
    Map<String, dynamic> data = {
      "marque": marque!.text,
      "plaque": couleurs,
      "couleur": nemeroplaque!.text,
      "model": model!.text,
      "numerochassie": numerochassie!.text,
      "categorie_id": int.parse(categorie!)
    };

    bloc!.add(
      POSTENGINS(
        data: data,
      ),
    );
  }

  void submitPutEngin(AppBloc? bloc) {
    Map<String, dynamic> data = {
      "id": selectedIdEngin,
      "marque": marque!.text,
      "plaque": couleurs,
      "couleur": nemeroplaque!.text,
      "model": model!.text,
      "numerochassie": numerochassie!.text,
      "categorie_id": int.parse(categorie!)
    };

    bloc!.add(
      POSTENGINS(
        data: data,
      ),
    );
  }
}
