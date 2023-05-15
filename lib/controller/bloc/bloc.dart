import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/app/ui/engin/engin_repo/engin_repository.dart';
import 'package:transport_app/app/ui/engin/engin_repo/model_engin.dart';
import 'package:transport_app/app/ui/login/user_repository/user_repo.dart';

import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(INITIALSTATE()) {
    on<CHANGEMENU>((event, emit) {
      emit(SUCCESS(value: event.index));
    });
    on<Login>(
      (event, emit) async {
        emit(const LOADING());
        try {
          var response = await login(
            username: event.username,
            password: event.password,
          );
          print(response);
          emit(
            SUCCESS(value: response),
          );
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
        }
      },
    );
    on<GETTENGIN>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getEngin();
        print(response.data);
        print(response.data.toString());
        ResultEngin resultEngin = ResultEngin.fromJson(response.data);

        emit(
          SUCCESS(
            value: resultEngin.data!,
          ),
        );
      } on Exception catch (e) {
        ERROR(dueTo: e.toString());
      }
    });
    on<POSTENGINS>(
      (event, emit) async {
        emit(const LOADING());
        try {
          await postEngi(data: event.data);
          emit(const SUCCESS());
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
          debugPrint(e.toString());
        }
      },
    );
  }
}
