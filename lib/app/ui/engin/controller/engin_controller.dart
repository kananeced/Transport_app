import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';

class EnginController {
  int? categorie;
  TextEditingController? marque;
  TextEditingController? model;
  String couleurs = "Jaune";
  double amount = 1000.0;
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
    bloc!.add(
      POSTENGINS(
        amount: amount,
        categoryId: categorie,
        couleur: couleurs,
        marque: marque!.text,
        model: model!.text,
        numerochassie: numerochassie!.text,
        numeroplaque: nemeroplaque!.text,
      ),
    );
  }

  void submitPutEngin(AppBloc? bloc) {
    bloc!.add(
      PUTENGINS(
        amount: amount,
        categoryId: categorie,
        couleur: couleurs,
        marque: marque!.text,
        model: model!.text,
        numerochassie: numerochassie!.text,
        numeroplaque: nemeroplaque!.text,
      ),
    );
  }
}
