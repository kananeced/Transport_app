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
