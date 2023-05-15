import 'package:dio/dio.dart';

import 'package:transport_app/service/api_url.dart';
import 'package:transport_app/service/http/dio_service.dart';

Future<Response> getEngin() async {
  return await httpGet(
    endPoint: "http://localhost/projets/ben-tp-php-api/view/enginview.php",
  );
}

Future<Response> postEngi({Map<String, dynamic>? data}) async {
  var x = await httpPost(
    endPoint: APIURL.POSTENGIN,
    data: data,
  );

  return x;
}
