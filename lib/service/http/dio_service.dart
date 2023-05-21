import 'dart:io';

import 'package:dio/dio.dart';

import 'package:transport_app/service/http/dio_helper.dart';
import 'package:transport_app/service/prefs/app_prefs.dart';
import 'package:transport_app/service/prefs/model.dart';

Future<Response> httpGet({String? endPoint}) async {
  return await DioApi().dio.get(endPoint!);
}

Future<Response> httpPost(
    {String? endPoint, Map<String, dynamic>? data}) async {
  return await DioApi().dio.post(endPoint!,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ));
}

Future<Response> httpPut({String? endPoint, var data}) async {
  return await DioApi().dio.put(endPoint!,
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ));
}

Future<Response> httpGetWithToken(
    {String? endPoint, Map<String, dynamic>? parameters}) async {
  AppPref appPref = AppPref();
  String? token = appPref.getUserInfo();

  return await DioApi().dio.get(
        endPoint!,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            'X-Requested-With': 'XMLHttpRequest',
            'Accept': 'application/json',
          },
        ),
      );
}
