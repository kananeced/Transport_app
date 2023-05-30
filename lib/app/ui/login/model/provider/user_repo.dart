import 'package:dio/dio.dart';

import 'package:transport_app/service/shared/api_url.dart';
import 'package:transport_app/service/http/dio_service.dart';

Future<Response> login({String? username, String? password}) async {
  return await httpPost(endPoint: APIURL.LOGIN, data: {
    "email": username,
    "password": password,
  });
}
