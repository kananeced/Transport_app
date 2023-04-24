import 'package:dio/dio.dart';

import 'package:transport_app/service/http/dio_helper.dart';

Future<Response> httpGet({String? endPoint}) async {
  return await DioApi().dio.get(endPoint!);
}

Future<Response> httpPost(
    {String? endPoint, Map<String, dynamic>? data}) async {
  return await DioApi().dio.post(
        endPoint!,
        data: data,
      );
}

Future<Response> httpPut({String? endPoint, var data}) async {
  return await DioApi().dio.put(
        endPoint!,
        data: data,
      );
}
