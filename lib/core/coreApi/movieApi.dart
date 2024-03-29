// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:movie_sample/core/res/constants.dart';

class MovieApi {
  Dio dio = Dio();
  Future<Response?> fetchMovies() async {
    try {
      final response = await dio.get<Map<String, dynamic>>('$omdbURL',
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZWJlZGNmNTE5YzlhZDA4YWQ3MGU1MWY4YWFhM2MxNSIsInN1YiI6IjY1OTc0ZmJmZWEzN2UwMDZmYTRkMDlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ERY6EDeSdog4MhB5Ix3B7VZVBbn1ELDdb0WYLiHvQ9c',
            'accept': 'application/json'
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return response;
      } else {
        print('blablablu');
        return null;
      }
    } on DioException catch (err) {
      print(err);
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

