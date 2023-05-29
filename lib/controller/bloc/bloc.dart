import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/app/ui/client/model/client_model.dart';
import 'package:transport_app/app/ui/client/model/provider/client_repository.dart';
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
          User? user = resultUser.user;
          UserPref userPref = UserPref(
            token: token,
            userPerfsInfo: UserPrefInfo(
              email: user!.email,
            ),
          );
          setUserInfo(userPref);

          emit(SUCCESS(value: response));
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
        }
      },
    );
    on<GETTENGIN>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getEngin();

        ResultEngins resultEngin = ResultEngins.fromJson(response.data);

        emit(
          SUCCESS(
            value: resultEngin.data!,
          ),
        );
      } on Exception catch (e) {
        ERROR(dueTo: e.toString());
      }
    });
    on<GETTCLIENT>((event, emit) async {
      emit(const LOADING());
      try {
        var response = await getClient();

        ResultClient resultClient = ResultClient.fromJson(response.data);

        emit(
          SUCCESS(
            value: resultClient.data!,
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
          await postEngi(
            amount: event.amount,
            categoryId: event.categoryId,
            couleur: event.couleur,
            marque: event.marque,
            model: event.model,
            numerochassie: event.numerochassie,
            numeroplaque: event.numeroplaque,
          );

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
          await putEngi(
            amount: event.amount,
            categoryId: event.categoryId,
            couleur: event.couleur,
            marque: event.marque,
            model: event.model,
            numerochassie: event.numerochassie,
            numeroplaque: event.numeroplaque,
          );
          emit(const SUCCESS());
        } on Exception catch (e) {
          ERROR(dueTo: e.toString());
          debugPrint(e.toString());
        }
      },
    );
  }
}
