import 'package:dio/dio.dart';

import 'models/header_model.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<Response> getData(ApiRequestModel request) async {
    return await dio!.get(
      request.endpoint,

      queryParameters: request.query,
      options: Options(
        headers: request.headers,
      ),
    );
  }

  static Future<Response> postData(ApiRequestModel request) async {
    return await dio!.post(
      request.endpoint,
      queryParameters: request.query,
      data: request.data,
      options: Options(
        headers: request.headers,
      ),
    );
  }

  static Future<Response> putData(ApiRequestModel request) async {
    return await dio!.put(
      request.endpoint,
      queryParameters: request.query,
      data: request.data,
      options: Options(
        headers: request.headers,
      ),
    );

  }

  static Future<Response> deleteData(ApiRequestModel request) async {
    return await dio!.delete(
      request.endpoint,
      queryParameters: request.query,
      data: request.data,
      options: Options(
        headers: request.headers,
      ),
    );
  }
}
