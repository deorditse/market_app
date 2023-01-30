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

String capitalizeFirst(String value) {
  if (value.trim().isEmpty) return "";
  return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
}

///todo так как данные в разных форматах приходят с сервера, не могу использовать generic

// Future<Map<int, dynamic>?> genericRequestHttp<T>({
//   required String nameMethod,
//   required Future<Function> setResponse,
//   int? myResponseStatus,
// }) async {
//   try {
//     var response = await setResponse;
//
//     if (response.statusCode == (myResponseStatus ?? 200)) {
//       return ifTheRequestPassed<T>(
//         responseBody: response.body.toString(),
//         responseStatus: response.statusCode,
//         nameMethod: nameMethod,
//       );
//     } else {
//       return theRequestFailed(
//         nameMethod: nameMethod,
//         responseStatus: response.statusCode,
//         data: response.body.toString(),
//       );
//     }
//   } catch (error) {
//     return errorRequest(
//       error: error,
//       nameMethod: nameMethod,
//     );
//   }
// }

Map<int, String> theRequestFailed({
  required String nameMethod,
  required int responseStatus,
  required String data,
}) {
  print('Status $responseStatus, from method $nameMethod data: $data');
  return {responseStatus: utf8.decode(data.codeUnits)};
}

Map<int, String> errorRequest(
    {required Object error, required String nameMethod}) {
  print('Error from method $nameMethod error: $error');
  //можно например что-то выводить на экран в этот момент
  return {0: 'Error from method $nameMethod error: $error'};
}
//
// Future<Map<int, T>?> ifTheRequestPassed<T>({
//   required String responseBody,
//   required int responseStatus,
//   required String nameMethod,
// }) async {
//   String myJson =
//       utf8.decode(responseBody.codeUnits); //json.decode(responseData!.body);
//
//   print(
//       'RequestPassed status $responseStatus from method $nameMethod data: ${myJson}');
//   print("runtimeType from Generic fromJson $T");
//
//   return {responseStatus: Generic.fromJson<T>(myJson)};
// }
//
// class Generic {
//   /// If T is a List, K is the subtype of the list.
//   static T fromJson<T>(String setJson) {
//     if (T == List<InfoOrderModel>) {
//       List<Map<String, dynamic>> listMap = List.from(json.decode(setJson));
//       List<InfoOrderModel> _res =
//           listMap.map((e) => InfoOrderModel.fromJson(e)).toList();
//       return _res as T;
//     } else if (T == bool || T == String || T == int || T == double) {
//       // primitives
//       return setJson as T;
//     } else {
//       throw Exception("Unknown class from Generic http request");
//     }
//   }
// }
