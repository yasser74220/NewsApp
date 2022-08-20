import 'package:dio/dio.dart';

class dioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response?> getData({
    required path,
    required Map<String, dynamic> query,
  }) async
  {
    return await dio?.get(path, queryParameters: query);
  }


}