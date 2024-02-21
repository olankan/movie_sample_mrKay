// ignore_for_file: avoid_print, camel_case_types
import 'package:dio/dio.dart';


class MoviesByGenreApiService {
  Dio dio = Dio();
  

 Future<Response?> getMoviesByGenre() async {
    try {
          const url = 'https://api.themoviedb.org/3/discover/movie?with_genres=28&api_key=1ebedcf519c9ad08ad70e51f8aaa3c15';
      final response = await dio.get<Map<String, dynamic>>(url,
          );
      if (response.statusCode == 200) {
        print(response.data);
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
