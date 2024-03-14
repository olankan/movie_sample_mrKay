import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogManagerInterceptor extends InterceptorsWrapper {
  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  // }

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // TODO: implement onRequest
  // }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    debugPrint('----------:API REQUEST:----------');
if(response.requestOptions.uri.path.contains('/reviews')){


    debugPrint('---Requests uri: ${response.requestOptions.uri}\n');
    debugPrint('---Requests Method: ${response.requestOptions.method}\n');
    debugPrint('---Requests Header: ${response.headers}\n');
    log('---Request: ${response.data}\n');
    debugPrint('----END----\n');
}
    //  super.onRequest(response, handler);
    return handler.next(response);
  }
}
