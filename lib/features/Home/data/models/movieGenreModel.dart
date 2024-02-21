// To parse this JSON data, do
//
//     final movieGenreModel = movieGenreModelFromJson(jsonString);

import 'dart:convert';

MovieGenreModel movieGenreModelFromJson(String str) => MovieGenreModel.fromJson(json.decode(str));

String movieGenreModelToJson(MovieGenreModel data) => json.encode(data.toJson());

class MovieGenreModel {
    final List<Genre>? genres;

    MovieGenreModel({
        this.genres,
    });

    factory MovieGenreModel.fromJson(Map<String, dynamic> json) => MovieGenreModel(
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    };
}

class Genre {
    final int? id;
    final String? name;

    Genre({
        this.id,
        this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
