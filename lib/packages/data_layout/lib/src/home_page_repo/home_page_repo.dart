import 'dart:convert';
import 'package:data_layout/data_layout.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';
import 'package:models/models.dart';

class HomePageRepo {
  //Роут для получения комнат
  Future<Map<int, dynamic>?> getListRooms({
    required Location location,
    required String userName,
    required String password,
  }) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

      var response = await http.post(
        urlMain(urlPath: '${location.name}/getroom/GetInfo'),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
      );

      final jsonData = json.decode(utf8.decode(response.body.codeUnits));

      if (response.statusCode == 200) {
        return {
          200: jsonData,
        };
      } else {
        return theRequestFailed(
          nameMethod: "getListRooms",
          responseStatus: response.statusCode,
          data: response.body.toString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: "getListRooms",
      );
    }
  }

//Роут для получения тасок
  Future<Map> getListTasks({
    required Location location,
    required String userName,
    required String password,
    required String roomName,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    try {
      var response = await http.post(
        urlMain(urlPath: '${location.name}/getorder/GetInfo'),
        // Uri.http("176.113.82.105/center/hs/Obmen/v1/getorder/GetInfo"),
        body: json.encode({"room": roomName}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
      );
      final jsonData = json.decode(utf8.decode(response.body.codeUnits));

      // List<String> jsonData = json.decode(utf8.decode(response.body.codeUnits));

      if (response.statusCode == 200) {
        List<InfoOrderModel> listTasks =
            await jsonData.map((e) => InfoOrderModel.fromJson(e)).toList();
        print(listTasks);
        return {200: jsonData};
      } else {
        return theRequestFailed(
          nameMethod: "getListTasks",
          responseStatus: response.statusCode,
          data: response.body.toString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: "getListTasks",
      );
    }
  }

  //Роут для печати orders
  Future<Map<int, dynamic>?> addPrintOrders({
    required Location location,
    required String userName,
    required String password,
    required Set<String> listIdOrders,
  }) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

      var response = await http.post(
        urlMain(urlPath: '${location.name}/print/GetInfo'),
        body: json.encode({
          "name": userName,
          "listIdOrders": listIdOrders.toList().toString(),
        }),
        headers: {'Authorization': basicAuth},
      );

      final jsonData = json.decode(utf8.decode(response.body.codeUnits));

      if (response.statusCode == 200) {
        return {200: jsonData};
      } else {
        return theRequestFailed(
          nameMethod: "addPrintOrders",
          responseStatus: response.statusCode,
          data: response.body.toString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: "addPrintOrders",
      );
    }
  }

  //отметить проблемный заказ
  Future<Map<int, dynamic>?> addProblemOrder({
    required Location location,
    required String userName,
    required String password,
    required InfoOrderModel problemOrder,
  }) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

      var response = await http.post(
        urlMain(urlPath: '${location.name}/problem/GetInfo'),
        body: json.encode({
          "name": userName,
          "Nomenclature": problemOrder.name,
          "id_order": problemOrder.id_order,
          "marking_PartA": problemOrder.marking_PartA,
          "marking_PartB": problemOrder.marking_PartB,
        }),
        headers: {'Authorization': basicAuth},
      );
      final jsonData = json.decode(utf8.decode(response.body.codeUnits));

      if (response.statusCode == 200) {
        return {200: jsonData};
      } else {
        return theRequestFailed(
          nameMethod: "addProblemOrder",
          responseStatus: response.statusCode,
          data: response.body.toString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: "addProblemOrder",
      );
    }
  }

  //отправить выполненные заказы
  Future<Map<int, dynamic>?> sendCompletedOrdersToTheServer({
    required Location location,
    required String userName,
    required String password,
    required List<String> listCompletedOrders,
  }) async {
    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

      var response = await http.post(
        urlMain(urlPath: '${location.name}/ready/GetInfo'),
        body: json.encode({
          "name": userName,
          "listIdOrders": listCompletedOrders.toString(),
        }),
        headers: {
          'Authorization': basicAuth,
        },
      );
      final jsonData = json.decode(utf8.decode(response.body.codeUnits));

      if (response.statusCode == 200) {
        return {200: jsonData};
      } else {
        return theRequestFailed(
          nameMethod: "sendCompletedOrdersToTheServer",
          responseStatus: response.statusCode,
          data: response.body.toString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: "sendCompletedOrdersToTheServer",
      );
    }
  }
}
