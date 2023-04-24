import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/app/providers/engin/engin_repository.dart';
import 'package:transport_app/app/providers/engin/model_engin.dart';
import 'package:transport_app/app/providers/user/user_repo.dart';

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
        ResultEngin resultEngin = ResultEngin.fromJson(response.data);
        debugPrint(resultEngin.data.toString());
        emit(
          SUCCESS(
            value: resultEngin.data!,
          ),
        );
      } on Exception catch (e) {
        ERROR(dueTo: e.toString());
      }
    });
  }
}
