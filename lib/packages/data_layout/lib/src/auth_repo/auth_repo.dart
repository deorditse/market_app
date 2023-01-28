import 'dart:convert';

import 'package:data_layout/data_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  ///Роут для авторизации
  Future<Map<int, dynamic>?> signInAuthData({
    required String userName,
    required String password,
  }) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

    var response = http.post(
      urlMain(urlPath: 'v1/Authorization/GetInfo'),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
    );

    return await genericRequestHttp<String>(
      nameMethod: 'signInAuthData',
      setResponse: response,
    );
  }

  //save in local storage
  FlutterSecureStorage? _storageSecure; //локальная база данных - секьюрная
  Future<void> savePassAndLoginInLocalStorage(
      {required String? username, required String? newPassword}) async {
    // логин save secure
    await _storageSecure?.write(
      key: 'username',
      value: username,
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );

    //save пароль с шифрованием через save secure
    await _storageSecure?.write(
      key: 'password',
      value: newPassword,
      iOptions: const IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  Future<Map<String, dynamic>> initialLoginAndPassword() async {
    _storageSecure = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    final String? _userName = await _storageSecure?.read(key: 'username');
    final String? _password = await _storageSecure?.read(key: 'password');
    return {
      "userName": _userName,
      "password": _password,
    };
  }
}
