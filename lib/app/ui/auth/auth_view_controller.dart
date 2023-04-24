import 'package:flutter/material.dart';
import 'package:transport_app/controller/bloc/bloc.dart';
import 'package:transport_app/controller/bloc/event.dart';

class AuthController {
  TextEditingController userName;
  TextEditingController passWord;
  TextEditingController names = TextEditingController();

  AuthController()
      : userName = TextEditingController(),
        passWord = TextEditingController();

  bool get validation =>
      userName.text.trim().isNotEmpty && passWord.text.trim().isNotEmpty;

  void submitPost(AppBloc? bloc) {
    bloc!.add(Login(
      password: passWord.text.trim(),
      username: userName.text.trim(),
    ));
  }
}
