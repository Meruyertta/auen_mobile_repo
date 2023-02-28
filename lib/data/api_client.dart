import 'package:auen/core/models/audio_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/logger.dart';
import '../core/models/user_model.dart';

class ApiClient {
  final Dio _dio = Dio();
  final _baseUrl = 'https://kajohny.pythonanywhere.com';

  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<UserModel> getUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    String? email = await _flutterSecureStorage.read(key: "email");
    Response userData = await _dio.get(_baseUrl + '/profile/api/$email');

    // Prints the raw data returned by the server
    logger.i('User Info: ${userData.data}');

    // Parsing the raw JSON data to the User class
    UserModel user = UserModel.fromJson(userData.data);

    return user;
  }

  Future<List<AudioModel>?> getAudioList() async {
    // Perform GET request to the endpoint "/users/<id>"
    final audioListResponse = await _dio.get(_baseUrl + '/music/api/');

    // Prints the raw data returned by the server
    logger.i('Audio data: ${audioListResponse.data}');

    final audioList=audioListResponse.data as List<dynamic>;

    return audioList.map((e) => AudioModel.fromJson(e as Map<String, dynamic>)).toList();

  }


  login({required String email, required String password}) async {
    try {
      Response response = await _dio.post(_baseUrl + '/login/api', data: {
        "email": email,
        "password": password,
      });
      return response;
    } catch (e) {
      logger.e('hi');
      logger.e(e.toString());
    }
  }
}
