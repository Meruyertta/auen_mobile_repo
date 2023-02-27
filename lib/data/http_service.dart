import 'dart:convert';
import 'package:auen/core/models/user_model.dart';
import 'package:auen/router/router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/logger.dart';
import 'package:dio/dio.dart';


class HttpService {
  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('https://kajohny.pythonanywhere.com/login/api');
  static final _profileUrlString =
 'https://kajohny.pythonanywhere.com/profile/api/';
  static final dio=Dio();

  static login(
    email,
    password,
    context,
  ) async {
    try {
      http.Response response = await _client.post(_loginUrl, body: {
        "email": email,
        "password": password,
      },);

      if (response.statusCode == 200) {
        logger.i(jsonDecode(response.body));
        var json = jsonDecode(response.body);

        if (json[0] == 'success') {
          await EasyLoading.showSuccess(json[0]);
          const storage = FlutterSecureStorage();
          storage.write(key: 'email', value: email);
          Navigator.pushReplacementNamed(context, AppRouter.home);
        } else {
          EasyLoading.showError(json[0]);
        }
      } else {
        await EasyLoading.showError(
            "Error Code : ${response.statusCode.toString()}");
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }

}
