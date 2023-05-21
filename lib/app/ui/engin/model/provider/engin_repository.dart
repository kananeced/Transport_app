import 'package:dio/dio.dart';

import 'package:transport_app/service/api_url.dart';
import 'package:transport_app/service/http/dio_service.dart';

Future<Response> getEngin() async {
  return await httpGet(
    endPoint: APIURL.GETENGIN,
  );
}

Future<Response> postEngi({Map<String, dynamic>? data}) async {
  return await httpPost(
    endPoint: APIURL.POSTENGIN,
    data: data,
  );
}

Future<Response> putEngi({Map<String, dynamic>? data}) async {
  return await httpPut(
    endPoint: APIURL.POSTENGIN,
    data: data,
  );
}
