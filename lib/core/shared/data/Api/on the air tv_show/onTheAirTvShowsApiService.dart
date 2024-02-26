// ignore_for_file: avoid_print, camel_case_types
import 'package:dio/dio.dart';

import '../../../../resources/constants.dart';

class OnTheAirMoviesApiService {
  Dio dio = Dio();
  Future<Response?> getOnTheAirMovies() async {
    try {
      const url =
          '$baseURL/tv/on_the_air?&api_key=$apiKey';
      final response = await dio.get<Map<String, dynamic>>(
        url,
      );
      if (response.statusCode == 200) {
        // print(response.data);
        return response;
      } else {
        // print('blablablu');
        return null;
      }
    } on DioException catch (err) {
      // print(err);
      return null;
    } catch (e) {
      // print('Error: $e');
      return null;
    }
  }
}
