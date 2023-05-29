import 'package:dio/dio.dart';
import 'package:transport_app/service/api_url.dart';
import 'package:transport_app/service/http/dio_service.dart';

Future<Response> getClient() async {
  return await httpGetWithToken(
    endPoint: APIURL.GETCLIENT,
  );
}
