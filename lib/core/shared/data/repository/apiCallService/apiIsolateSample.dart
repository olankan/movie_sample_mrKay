// // ignore_for_file: file_names
// import 'dart:async';
// import 'dart:isolate';

// import 'package:dio/dio.dart';
// import 'package:movie_sample/core/shared/data/Api/ApiCall/movieApiService.dart';

// import '../../../../resources/constants.dart';
// import '../../../domain/repository/apiCallServiceInterface/apiCallServiceInterface.dart';

// class ApiCallService implements ApiCallServiceInterface {
//   final MoviesApiService _moviesApiService = MoviesApiService();

//   // Function to perform API call in a separate isolate
//   Future<Response?> _performApiCall(String path) async {
//     final completer = Completer<Response?>();

//     // Create a new receive port to get the response from the isolate
//     final receivePort = ReceivePort();

//     // Spawn a new isolate with the API call function
//     await Isolate.spawn(_apiCallIsolate, {
//       'sendPort': receivePort.sendPort,
//       'path': path,
//     });

//     // Listen for the response from the isolate
//     receivePort.listen((dynamic data) {
//       if (data is Response) {
//         completer.complete(data); // Complete the future with the response
//       } else {
//         completer.completeError(data); // Complete the future with an error
//       }
//       receivePort.close(); // Close the receive port after receiving the response
//     });

//     return completer.future;
//   }

//   // Isolate entry function for API call
//   static void _apiCallIsolate(Map<String, dynamic> message) async {
//     final SendPort sendPort = message['sendPort'];
//     final String path = message['path'];

//     try {
//       // Perform API call
//       final apiService = ApiCallService();
//       final response = await apiService._moviesApiService.call(path);

//       // Send the response back to the main isolate
//       sendPort.send(response);
//     } catch (error) {
//       // Send error back to the main isolate
//       sendPort.send(error.toString());
//     }
//   }

//   @override
//   Future<Response?> getAiringToday() => _performApiCall('/tv/airing_today?&api_key=$apiKey');

//   @override
//   Future<Response?> getMovieRecommendations(id) => _performApiCall('/movie/$id/recommendations?&api_key=$apiKey');

//   @override
//   Future<Response?> getDiscoveredMovies() => _performApiCall(discoverMoviesURL);

//   @override
//   Future<Response?> getMoviesByGenre(id) => _performApiCall('/discover/movie?with_genres=$id&api_key=$apiKey');

//   @override
//   Future<Response?> getMovieCredits(id) => _performApiCall('/movie/$id/credits?&api_key=$apiKey');

//   @override
//   Future<Response?> getMovieReviews(id) => _performApiCall('/movie/$id/reviews?&api_key=$apiKey');

//   @override
//   Future<Response?> getMovieVideos(id) => _performApiCall('/movie/$id/videos?&api_key=$apiKey');

//   @override
//   Future<Response?> getMovieWatchProviders(id) => _performApiCall('/movie/$id/watch/providers?&api_key=$apiKey');

//   @override
//   Future<Response?> getNowPlayingMovies() => _performApiCall('/movie/now_playing?&api_key=$apiKey');

//   @override
//   Future<Response?> getOnTheAirMovies() => _performApiCall('/tv/on_the_air?&api_key=$apiKey');

//   @override
//   Future<Response?> getPopularMovies() => _performApiCall('/movie/popular?&api_key=$apiKey');

//   @override
//   Future<Response?> getPopularTvShows() => _performApiCall('/tv/popular?&api_key=$apiKey');

//   @override
//   Future<Response?> getSimilarMovies(id) => _performApiCall('/movie/$id/similar?&api_key=$apiKey');

//   @override
//   Future<Response?> getTopRatedMovies() => _performApiCall('/movie/top_rated?&api_key=$apiKey');

//   @override
//   Future<Response?> getUpcomingMovies() => _performApiCall('/movie/upcoming?&api_key=$apiKey');
// }
