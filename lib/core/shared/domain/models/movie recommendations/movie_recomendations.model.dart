// To parse this JSON data, do
//
//     final movieRecommendationsModel = movieRecommendationsModelFromJson(jsonString);

import 'dart:convert';

MovieRecommendationsModel movieRecommendationsModelFromJson(String str) => MovieRecommendationsModel.fromJson(json.decode(str));

String movieRecommendationsModelToJson(MovieRecommendationsModel data) => json.encode(data.toJson());

class MovieRecommendationsModel {
    final int? page;
    final List<Result>? results;

    MovieRecommendationsModel({
        this.page,
        this.results,
    });

    factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) => MovieRecommendationsModel(
        page: json["page"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    final bool? adult;
    final String? backdropPath;
    final int? id;
    final String? title;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final String? posterPath;
    final String? mediaType;
    final List<int>? genreIds;
    final double? popularity;
    final DateTime? releaseDate;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    Result({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
