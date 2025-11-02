import 'package:dio/dio.dart';

class Client {
 final Dio dio;
  Client(String baseUrl)
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 20),
          headers: {'Accept': 'application/json'},
        )) {
    dio.interceptors.add(LogInterceptor(  //istekleri logluyor 
      requestBody: true,
      responseBody: true,
    ));
  }
}