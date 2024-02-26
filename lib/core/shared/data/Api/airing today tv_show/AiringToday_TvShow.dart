// ignore_for_file: avoid_print, camel_case_types
import 'package:dio/dio.dart';
import 'package:movie_sample/core/resources/constants.dart';

class AiringTodayApiService {
  Dio dio = Dio();
  Future<Response?> getAiringTodayMovies() async {
    try {
      const url = '$baseURL/tv/airing_today?&api_key=$apiKey';
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
