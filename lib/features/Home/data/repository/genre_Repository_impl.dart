import 'package:movie_sample/features/Home/domain/repository/genre_repository.dart';

class GenreInfo implements GenreInfoRepo {
  @override
  String getGenreNameById(int id) {
    final List<Map<String, dynamic>> genresData = [
      {"id": 28, "name": "Action"},
      {"id": 12, "name": "Adventure"},
      {"id": 16, "name": "Animation"},
      {"id": 35, "name": "Comedy"},
      {"id": 80, "name": "Crime"},
      {"id": 99, "name": "Documentary"},
      {"id": 18, "name": "Drama"},
      {"id": 10751, "name": "Family"},
      {"id": 14, "name": "Fantasy"},
      {"id": 36, "name": "History"},
      {"id": 27, "name": "Horror"},
      {"id": 10402, "name": "Music"},
      {"id": 9648, "name": "Mystery"},
      {"id": 10749, "name": "Romance"},
      {"id": 878, "name": "Science Fiction"},
      {"id": 10770, "name": "TV Movie"},
      {"id": 53, "name": "Thriller"},
      {"id": 10752, "name": "War"},
      {"id": 37, "name": "Western"}
    ];

    for (var genre in genresData) {
      if (genre["id"] == id) {
        return genre["name"];
      }
    }
    // If the ID is not found, you can return a default value or handle it accordingly.
    return "Unknown Genre";
  }
}