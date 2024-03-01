// ignore_for_file: file_names

import 'package:dio/dio.dart';

class MoviesApiService {
  Dio dio = Dio();
  Future<Response?> call(String url) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(url,
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
            'accept': 'application/json'
          }));
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
