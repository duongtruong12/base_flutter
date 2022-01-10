import 'dart:convert';

import 'package:base_flutter/data/api/api_config.dart';
import 'package:base_flutter/utils/global/globals_functions.dart'
    as global_functions;
import 'package:base_flutter/utils/global/globals_variable.dart'
    as global_variable;
import 'package:base_flutter/utils/global/globals_variable.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  static String url = '<api_host>';
  static BaseOptions baseOptions = BaseOptions(baseUrl: url);

  final Dio _dio = Dio(baseOptions)
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ' + (global_variable.idToken ?? '');
          return handler.next(options);
        },
        onResponse: (options, handler) {
          global_variable.loading.value = false;
          return handler.next(options);
        },
        onError: (e, handler) {
          try {
            if (e.response != null) {
              var options = e.response!.requestOptions;
              if (options.path != 'checkVersion') {
                if (e.response!.data != null &&
                    '${e.response!.data}'.isNotEmpty) {
                  if (e.response!.data is String) {
                    var data = jsonDecode(e.response!.data);
                    if (options.method == 'GET') {
                      logger.v(options.queryParameters);
                    } else {
                      logger.v(options.data);
                    }
                    // if (data['status'] == 401) {
                    //   if (options.path != 'api/users/authenticate') {
                    //     logout();
                    //   }
                    // }
                    global_functions.showError(data['detail']);
                  } else {
                    if (e.response!.requestOptions.path == 'urlLink' &&
                        e.response!.requestOptions.queryParameters['isRead'] !=
                            null) {
                      logger.v(e);
                    } else if (e.response!.data['statusCode'] != null) {
                      global_functions.showError(e.response!.data['message']);
                    }
                  }
                }
              }
            }
          } catch (e) {
            logger.e(e);
          }

          global_variable.loading.value = false;
          return handler.next(e);
        },
      ),
    );

  Future<dynamic> _post(String path, {data}) async {
    return (await _dio.post('${ApiConfig.api[path]}', data: data)).data;
  }

  Future<dynamic> _get(String path, {queryParameters}) async {
    return (await _dio.get('${ApiConfig.api[path]}',
            queryParameters: queryParameters))
        .data;
  }

  Future<dynamic> checkVersion(data) {
    return _get('checkVersion', queryParameters: data);
  }

  Future<dynamic> login(data) {
    return _post('login', data: data);
  }

  Future<dynamic> logout(data) {
    return _post('logout', data: data);
  }
}
