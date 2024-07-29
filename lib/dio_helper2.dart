import 'package:dio/dio.dart';

class DioHelper2 {
  static Dio? dio2;

  static init() {
    dio2 = Dio(
      BaseOptions(
          baseUrl: 'https://fakestoreapi.com/',
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio2!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang,
    };
    return await dio2!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio2!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang,
    };
    return await dio2!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio2!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      'lang': lang,
    };
    return await dio2!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio2!.delete(queryParameters: query, url, data: data);
  }
}
