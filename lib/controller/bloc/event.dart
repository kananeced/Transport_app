abstract class AppEvent {}

/*
   THOSE ARE EVENTS FOR THE USER INTERFACE
*/
class CHANGEMENU implements AppEvent {
  final int index;
  CHANGEMENU(this.index);
}

class Login implements AppEvent {
  final String? username;
  final String? password;

  Login({
    required this.username,
    required this.password,
  });
}

class GETTENGIN implements AppEvent {}

class GETTCLIENT implements AppEvent {}

class POSTENGINS implements AppEvent {
  String? marque;
  int? categoryId;
  String? couleur;
  String? numeroplaque;
  String? numerochassie;
  String? model;
  double? amount;
  POSTENGINS({
    required this.marque,
    required this.categoryId,
    required this.couleur,
    required this.numeroplaque,
    required this.numerochassie,
    required this.model,
    required this.amount,
  });
}

class PUTENGINS implements AppEvent {
  String? marque;
  int? categoryId;
  String? couleur;
  String? numeroplaque;
  String? numerochassie;
  String? model;
  double? amount;
  PUTENGINS({
    required this.marque,
    required this.categoryId,
    required this.couleur,
    required this.numeroplaque,
    required this.numerochassie,
    required this.model,
    required this.amount,
  });
}
