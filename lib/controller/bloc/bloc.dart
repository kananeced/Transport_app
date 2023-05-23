import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/app/ui/engin/model/provider/engin_repository.dart';
import 'package:transport_app/app/ui/engin/model/model_engin.dart';
import 'package:transport_app/app/ui/login/model/model_user.dart';

import 'package:transport_app/app/ui/login/model/provider/user_repo.dart';

import 'package:transport_app/controller/bloc/event.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:transport_app/service/prefs/app_prefs.dart';

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
          ResultUser resultUser = ResultUser.fromJson(response.data);
          String? token = resultUser.token;
          AppPref appPref = AppPref();
          appPref.getUserInfo(token: token);
          emit(SUCCESS(value: response));
          print(appPref.getUserInfo());
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
          print(e.toString());
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
    on<PUTENGINS>(
      (event, emit) async {
        emit(const LOADING());
        try {
          await putEngi(data: event.data);
          emit(const SUCCESS());
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
          debugPrint(e.toString());
        }
      },
    );
  }
}
