import 'package:dio/dio.dart';
import 'package:transport_app/app/ui/engin/model/model_engin.dart';

import 'package:transport_app/service/shared/api_url.dart';
import 'package:transport_app/service/http/dio_service.dart';

Future<Response> getEngin() async {
  return await httpGetWithToken(
    endPoint: APIURL.GETENGIN,
  );
}

Future<Response> postEngi({
  String? marque,
  int? categoryId,
  String? couleur,
  String? numeroplaque,
  String? numerochassie,
  String? model,
  double? amount,
}) async {
  return await httpPostWithToken(
    endPoint: APIURL.POSTENGIN,
    data: {
      "marque": marque,
      "numeroplaque": numeroplaque,
      "couleur": couleur,
      "model": model,
      "amount": amount,
      "numerochassie": numerochassie,
      "category_id": categoryId
    },
  );
}

Future<Response> putEngi({
  required String? marque,
  required int? categoryId,
  required String? couleur,
  required String? numeroplaque,
  required String? numerochassie,
  required String? model,
  required double? amount,
}) async {
  return await httpPutWithToken(
      endPoint: APIURL.PUTENGIN + selectedIdEngin!,
      data: {
        "marque": marque,
        "numeroplaque": numeroplaque,
        "couleur": couleur,
        "model": model,
        "amount": amount,
        "numerochassie": numerochassie,
        "category_id": categoryId
      });
}
