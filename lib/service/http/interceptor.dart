import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:transport_app/service/common_error.dart';

@immutable
class ApiInterceptor extends Interceptor {
  final Dio dio;
  ApiInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadLineExcededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions,
                data: err.response!.data);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
          default:
            throw ValidationInternalServerErrorException(err.requestOptions,
                data: err.response!.data);
        }
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(requestOptions: err.requestOptions);
    }
  }
}

class ValidationInternalServerErrorException extends DioError {
  final Map<String, dynamic>? data;
  ValidationInternalServerErrorException(RequestOptions r, {this.data})
      : super(requestOptions: r);

  @override
  String toString() {
    return jsonEncode(data);
  }
}

// if there is a time out, that mean the client don't reach the
// server, throw this exception

class DeadLineExcededException extends DioError {
  DeadLineExcededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    ErrorData errormodel = ErrorData(
        message: "Une erreur s'est produite en essayant de joindre le serveur");

    return jsonEncode(errormodel.toJson());
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    ErrorData errormodel =
        ErrorData(message: "Mauvaise requette | Bad request error");

    return jsonEncode(errormodel.toJson());
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    ErrorData error = ErrorData(
        message: "Erreur de l'auhentification au serveur | Unauthorized error");

    return jsonEncode(error.toJson());
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    ErrorData error = ErrorData(
        message:
            "Une erreur s'est produite, ceci est du à l'url que vous entrez | not found error");
    return jsonEncode(error.toJson());
  }
}

class ConflictException extends DioError {
  final Map<String, dynamic>? data;
  ConflictException(RequestOptions r, {this.data}) : super(requestOptions: r);

  @override
  String toString() {
    return jsonEncode(data);
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    ErrorData error = ErrorData(
        message:
            "Une erreur s'est produite au serveur | internal server error");

    return jsonEncode(error.toJson());
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException({required super.requestOptions});

  @override
  String toString() {
    ErrorData error = ErrorData(
      message:
          "Aucune connexion internet, veuillez vous connecter puis réessayer",
    );

    return jsonEncode(error.toJson());
  }
}
