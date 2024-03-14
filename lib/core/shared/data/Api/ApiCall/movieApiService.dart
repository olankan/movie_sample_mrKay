// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:movie_sample/core/shared/data/Api/ApiCall/interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MoviesApiService {
  Dio dio = Dio();
  Future<Response?> call(String url) async {
    // dio.interceptors.add(LogManagerInterceptor());
    // ..add(PrettyDioLogger(
    //     requestHeader: false,
    //     requestBody: false,
    //     responseBody: true,
    //     responseHeader: true,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90));

    dio.options =
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3', headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
      'accept': 'application/json'
    });
    try {
      final response = await dio.get<Map<String, dynamic>>(url);
      if (response.statusCode == 200) {
        // print(response.data);

        return response;
      } else {
        return null;
      }
    } on DioException catch (err) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
