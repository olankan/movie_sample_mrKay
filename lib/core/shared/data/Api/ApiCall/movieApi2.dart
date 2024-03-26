// import 'dart:async';
// import 'dart:isolate';
// import 'package:dio/dio.dart';
// import 'package:movie_sample/core/shared/data/Api/ApiCall/interceptor.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class MoviesApiService {
//   final Dio _dio = Dio();

//   Future<Response?> call(String url) async {
//     final ReceivePort receivePort = ReceivePort();
//     await Isolate.spawn(_callInIsolate, _IsolateMessage(url, receivePort.sendPort));
//     receivePort.close();
//     return await receivePort.first;
//   }

//   static void _callInIsolate(_IsolateMessage message) async {
//     final Dio dio = Dio();
//     dio.interceptors.add(LogManagerInterceptor());

//     dio.options = BaseOptions(
//       baseUrl: 'https://api.themoviedb.org/3',
//       headers: {
//           'Authorization':
//           'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
//       'accept': 'application/json'
//       }
//     );

//     try {
//       final Response response = await dio.get<Map<String, dynamic>>(message.url);
//       message.sendPort.send(response);
//     } catch (e) {
//       message.sendPort.send(null);
//     }
//   }
// }

// class _IsolateMessage {
//   final String url;
//   final SendPort sendPort;

//   _IsolateMessage(this.url, this.sendPort);
// }

// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/data/Api/ApiCall/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MoviesApiService {
  final Dio _dio = Dio();

  Future<Response?> call(String url) async {
    final ReceivePort receivePort = ReceivePort();
    print('Isolate spawning...');
    await Isolate.spawn(
        _callInIsolate, _IsolateMessage(url, receivePort.sendPort));
    print('Waiting for response...');
    final response = await receivePort.first;
    receivePort.close();
    print('Response received: $response');
    return response;
  }

  static void _callInIsolate(_IsolateMessage message) async {
    print('Isolate receiving message: ${message.url}');
    final Dio dio = Dio();

    dio.options =
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3', headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
      'accept': 'application/json'
    });

    try {
      print('Isolate making request...');
      final Response response =
          await dio.get<Map<String, dynamic>>(message.url);
      print('Isolate sending response: $response');
      message.sendPort.send(response);
    } catch (e) {
      print('Isolate sending error: $e');
      message.sendPort.send(null);
    }
  }
}

class _IsolateMessage {
  final String url;
  final SendPort sendPort;

  _IsolateMessage(this.url, this.sendPort);
}
