import 'dart:convert';
import 'package:models/models.dart';
import 'package:models/models.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

String urlMainApiConst = 'http://176.113.82.105/center/hs/Obmen/';

Uri urlMain({required String urlPath}) => Uri.parse(urlMainApiConst + urlPath);

/// централизованная обработка ошибок для запросов
// if responseStatus != 200

Future<Map<int, dynamic>?> genericRequestHttp<T>({
  required String nameMethod,
  required Future<http.Response> setResponse,
  int? myResponseStatus,
}) async {
  try {
    var response = await setResponse;

    if (response.statusCode == (myResponseStatus ?? 200)) {
      return ifTheRequestPassed<T>(
        responseData: response.body,
        responseStatus: response.statusCode,
        nameMethod: nameMethod,
      );
    } else {
      return theRequestFailed(
        nameMethod: nameMethod,
        responseStatus: response.statusCode,
        data: response.body,
      );
    }
  } catch (error) {
    return errorRequest(
      error: error,
      nameMethod: nameMethod,
    );
  }
}

Map<int, String>? theRequestFailed({
  required String nameMethod,
  required int responseStatus,
  required String data,
}) {
  print('Status $responseStatus, from method $nameMethod data: $data');
  return {responseStatus: utf8.decode(data.codeUnits)};
}

dynamic errorRequest({required Object error, required String nameMethod}) {
  print('Error from method $nameMethod error: $error');
  //можно например что-то выводить на экран в этот момент
  return 'Error from method $nameMethod error: $error';
}

Map<int, T>? ifTheRequestPassed<T>({
  required String responseData,
  required int responseStatus,
  required String nameMethod,
}) {
  print(
      'RequestPassed status $responseStatus from method $nameMethod data: ${utf8.decode(responseData.codeUnits)}');
  print("runtimeType from Generic fromJson $T");
  return {
    responseStatus: Generic.fromJson<T>(utf8.decode(responseData.codeUnits)),
  };
}

class Generic {
  /// If T is a List, K is the subtype of the list.
  static T fromJson<T>(dynamic setJson) {
    if (T == List<InfoOrderModel>) {
      List<Map<String, dynamic>> listMap =
          List.from(json.decode(setJson.toString()));
      List<InfoOrderModel> _res =
          listMap.map((e) => InfoOrderModel.fromJson(e)).toList();
      return _res as T;
    } else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return setJson as T;
    } else {
      throw Exception("Unknown class");
    }
  }
}
