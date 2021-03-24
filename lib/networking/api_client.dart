import 'dart:io';

import 'package:dio/dio.dart';
import 'package:getxtest/models/login_model.dart';

class ApiClient{
  static final String baseUrl = 'https://technofyindia.com/joy_laravel/public/api/v1/';



  var dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 100000,
      sendTimeout: 10000,
      receiveTimeout: 100000,
      headers: <String,dynamic>{
        HttpHeaders.userAgentHeader: 'dio',
        'api': '1.0.0',
      },
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain,
    ),
  );


  Future<LoginResp> login(String phone, String pin, String deviceToken)async{
    final url='login';
    var data = {'phone': phone, 'pin': pin, 'device_token':deviceToken};
    Response response;
    try {
      response = await dio.post<LoginResp>(url, data: data);
      var loginResp = loginRespFromJson(response.data.toString());
      return loginResp;
    } catch (error) {
      print(error.toString());
      return LoginResp(message: error.toString());
    }
  }
}