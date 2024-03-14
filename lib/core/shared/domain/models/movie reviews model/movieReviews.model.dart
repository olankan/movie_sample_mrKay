// // To parse this JSON data, do
// //
// //     final movieReviewsModel = movieReviewsModelFromJson(jsonString);

import 'dart:convert';

// MovieReviewsModel movieReviewsModelFromJson(String str) => MovieReviewsModel.fromJson(json.decode(str));

// String movieReviewsModelToJson(MovieReviewsModel data) => json.encode(data.toJson());

// class MovieReviewsModel {
//     final int? id;
//     final int? page;
//     final List<Result>? results;

//     MovieReviewsModel({
//         this.id,
//         this.page,
//         this.results,
//     });

//     factory MovieReviewsModel.fromJson(Map<String, dynamic> json) => MovieReviewsModel(
//         id: json["id"],
//         page: json["page"],
//         results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "page": page,
//         "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
//     };
// }

// class Result {
//     final String? author;
//     final AuthorDetails? authorDetails;
//     final String? content;
//     final String? createdAt;
//     final String? id;
//     final String? updatedAt;
//     final String? url;

//     Result({
//         this.author,
//         this.authorDetails,
//         this.content,
//         this.createdAt,
//         this.id,
//         this.updatedAt,
//         this.url,
//     });

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         author: json["author"],
//         authorDetails: json["author_details"] == null ? null : AuthorDetails.fromJson(json["author_details"]),
//         content: json["content"],
//         createdAt: json["created_at"],
//         id: json["id"],
//         updatedAt: json["updated_at"],
//         url: json["url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "author": author,
//         "author_details": authorDetails?.toJson(),
//         "content": content,
//         "created_at": createdAt,
//         "id": id,
//         "updated_at": updatedAt,
//         "url": url,
//     };
// }

// class AuthorDetails {
//     final String? name;
//     final String? username;
//     final String? avatarPath;
//     final int? rating;

//     AuthorDetails({
//         this.name,
//         this.username,
//         this.avatarPath,
//         this.rating,
//     });

//     factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
//         name: json["name"],
//         username: json["username"],
//         avatarPath: json["avatar_path"],
//         rating: json["rating"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "username": username,
//         "avatar_path": avatarPath,
//         "rating": rating,
//     };
// }

class MovieReviewsModel {
  final int? id;
  final int? page;
  final List<Review>? results;
  final int? totalPages;
  final int? totalResults;

  MovieReviewsModel({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieReviewsModel.fromJson(Map<String, dynamic> json) {
      // print("Raw JSON: $json");
    return MovieReviewsModel(
      id: json['id'],
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((result) => Review.fromJson(result))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Review {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? url;

  Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      authorDetails: json['author_details'] != null
          ? AuthorDetails.fromJson(json['author_details'])
          : null,
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }
}

class AuthorDetails {
  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  AuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating'],
    );
  }
}
