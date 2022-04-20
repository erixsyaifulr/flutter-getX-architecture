import 'dart:async';
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:my_architecture/constants/endpoints.dart';

import 'env.dart';
import 'logging_interceptor.dart';

/// Helper class for configuring Api calls
class ApiBaseHelper {
  Dio? dio;
  Alice? alice;

  ApiBaseHelper() {
    alice = Alice(showNotification: true);
    var options = BaseOptions(
      receiveTimeout: EndPoints.timeOut,
      connectTimeout: EndPoints.timeOut,
    );
    options.baseUrl =
        EnvironmentConstants.setEnvironment(Environment.development);
    dio = Dio(
      options,
    );
    dio!.interceptors.add(LoggingInterceptors());
    dio!.interceptors
        .add(alice!.getDioInterceptor()); //displays logs in notification view
  }

  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> post(String url, Map<String, dynamic> params) async {
    FormData body = FormData.fromMap(params);
    var response = await dio!.post(url,
        data: body, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, Map<String, dynamic> params) async {
    dio!.options.headers["Authorization"] = "";
    var response = await dio!.put(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, Map<String, String> params) async {
    var response = await dio!.delete(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : GET
  /// Params : url
  Future<Response> getWithoutParams(String url) async {
    var response =
        await dio!.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response> getWithParam(String url, Map<String, dynamic> params) async {
    var response = (await dio?.get(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json)))!;
    return response;
  }
}

/// Api Response codes
class ApiResponseCode {
  static const int success200 = 200;
  static const int success201 = 201;
  static const int error400 = 400;
  static const int error499 = 499;
  static const int error401 = 201;
  static const int error404 = 201;
  static const int error500 = 500;
  static const int internetUnavailable = 999;
  static const int unknown = 533;
}
