import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transport_app/controller/bloc/state.dart';
import 'package:transport_app/service/common_error.dart';
import 'package:transport_app/service/http/interceptor.dart';

hundleError({required Exception e, required Emitter<AppState> emit}) {
  bool isUpperzPubException = e is ValidationInternalServerErrorException ||
      e is DeadLineExcededException ||
      e is BadRequestException ||
      e is UnauthorizedException ||
      e is NotFoundException ||
      e is ConflictException ||
      e is InternalServerErrorException ||
      e is NoInternetConnectionException;

  if (isUpperzPubException) {
    Map<String, dynamic> data = jsonDecode(e.toString());
    ErrorData errormodele = ErrorData.fromJson(data);
    emit(
      ERROR(
        dueTo: errormodele,
      ),
    );
  } else {
    ErrorData errormodel = ErrorData();
    ErrorData(message: "Une erreur s'est produite veuillez  ressayer plustard");

    emit(
      ERROR(
        dueTo: errormodel,
      ),
    );
  }
}
