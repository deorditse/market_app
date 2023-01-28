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
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = http.post(
      urlMain(urlPath: '${location.name}/getroom/GetInfo'),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
    );
    return await genericRequestHttp<String>(
      nameMethod: 'getListRooms',
      setResponse: response,
    );
  }

//Роут для получения тасок
  Future<Map<int, dynamic>?> getListTasks({
    required Location location,
    required String userName,
    required String password,
    required String roomName,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = http.post(
      urlMain(urlPath: '${location.name}/getorder/GetInfo'),
      // Uri.http("176.113.82.105/center/hs/Obmen/v1/getorder/GetInfo"),
      body: json.encode({"room": roomName}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    return await genericRequestHttp<List<InfoOrderModel>>(
      nameMethod: 'getListTasks',
      setResponse: response,
    );
  }

  //Роут для печати orders
  Future<Map<int, dynamic>?> addPrintOrders({
    required Location location,
    required String userName,
    required String password,
    required Set<String> listIdOrders,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = http.post(
      urlMain(urlPath: '${location.name}/print/GetInfo'),
      body: json.encode({
        "name": userName,
        "listIdOrders": listIdOrders.toList().toString(),
      }),
      headers: {
        'Authorization': basicAuth,
      },
    );
    return await genericRequestHttp<String>(
      nameMethod: 'addPrintOrders',
      setResponse: response,
    );
  }

  //отметить проблемный заказ
  Future<Map<int, dynamic>?> addProblemOrder({
    required Location location,
    required String userName,
    required String password,
    required InfoOrderModel problemOrder,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var post = http.post(
      urlMain(urlPath: '${location.name}/problem/GetInfo'),
      body: json.encode({
        "name": userName,
        "Nomenclature": problemOrder.name,
        "id_order": problemOrder.id_order,
        "marking_PartA": problemOrder.marking_PartA,
        "marking_PartB": problemOrder.marking_PartB,
      }),
      headers: {
        'Authorization': basicAuth,
      },
    );
    var response = post;
    return await genericRequestHttp<String>(
      nameMethod: 'addProblemOrder',
      setResponse: response,
    );
  }

  //отправить выполненные заказы
  Future<Map<int, dynamic>?> sendCompletedOrdersToTheServer({
    required Location location,
    required String userName,
    required String password,
    required List<String> listCompletedOrders,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var post = http.post(
      urlMain(urlPath: '${location.name}/ready/GetInfo'),
      body: json.encode({
        "name": userName,
        "listIdOrders": listCompletedOrders.toString(),
      }),
      headers: {
        'Authorization': basicAuth,
      },
    );
    var response = post;
    return await genericRequestHttp<String>(
      nameMethod: 'sendCompletedOrdersToTheServer',
      setResponse: response,
    );
  }
}
