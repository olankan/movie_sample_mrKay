// To parse this JSON data, do
//
//     final movieWatchProvidersModel = movieWatchProvidersModelFromJson(jsonString);

import 'dart:convert';

MovieWatchProvidersModel movieWatchProvidersModelFromJson(String str) =>
    MovieWatchProvidersModel.fromJson(json.decode(str));

String movieWatchProvidersModelToJson(MovieWatchProvidersModel data) =>
    json.encode(data.toJson());

class MovieWatchProvidersModel {
  final int? id;
  final Results? results;

  MovieWatchProvidersModel({
    this.id,
    this.results,
  });

  factory MovieWatchProvidersModel.fromJson(Map<String, dynamic> json) =>
      MovieWatchProvidersModel(
        id: json["id"],
        results:
            json["results"] == null ? null : Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "results": results?.toJson(),
      };
}

class Results {
  final Au? au;

  Results({
    this.au,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        au: json["AU"] == null ? null : Au.fromJson(json["AU"]),
      );

  Map<String, dynamic> toJson() => {
        "AU": au?.toJson(),
      };
}

class Au {
  final String? link;
  final List<Buy>? rent;
  final List<Buy>? buy;

  Au({
    this.link,
    this.rent,
    this.buy,
  });

  factory Au.fromJson(Map<String, dynamic> json) => Au(
        link: json["link"],
        rent: json["rent"] == null
            ? []
            : List<Buy>.from(json["rent"]!.map((x) => Buy.fromJson(x))),
        buy: json["buy"] == null
            ? []
            : List<Buy>.from(json["buy"]!.map((x) => Buy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "rent": rent == null
            ? []
            : List<dynamic>.from(rent!.map((x) => x.toJson())),
        "buy":
            buy == null ? [] : List<dynamic>.from(buy!.map((x) => x.toJson())),
      };
}

class Buy {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  Buy({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Buy.fromJson(Map<String, dynamic> json) => Buy(
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
        displayPriority: json["display_priority"],
      );

  Map<String, dynamic> toJson() => {
        "logo_path": logoPath,
        "provider_id": providerId,
        "provider_name": providerName,
        "display_priority": displayPriority,
      };
}
