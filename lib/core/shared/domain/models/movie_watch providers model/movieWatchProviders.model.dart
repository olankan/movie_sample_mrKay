// To parse this JSON data, do
//
//     final movieWatchProvidersModel = movieWatchProvidersModelFromJson(jsonString);

import 'dart:convert';

MovieWatchProvidersModel movieWatchProvidersModelFromJson(String str) => MovieWatchProvidersModel.fromJson(json.decode(str));

String movieWatchProvidersModelToJson(MovieWatchProvidersModel data) => json.encode(data.toJson());

class MovieWatchProvidersModel {
    final int? id;
    final Results? results;

    MovieWatchProvidersModel({
        this.id,
        this.results,
    });

    factory MovieWatchProvidersModel.fromJson(Map<String, dynamic> json) => MovieWatchProvidersModel(
        id: json["id"],
        results: json["results"] == null ? null : Results.fromJson(json["results"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": results?.toJson(),
    };
}

class Results {
    final Au? au;
    final Ca? ca;
    final Es? es;
    final Ca? gb;
    final Ca? ie;
    final Ca? nz;
    final Ca? pg;
    final Ca? us;

    Results({
        this.au,
        this.ca,
        this.es,
        this.gb,
        this.ie,
        this.nz,
        this.pg,
        this.us,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        au: json["AU"] == null ? null : Au.fromJson(json["AU"]),
        ca: json["CA"] == null ? null : Ca.fromJson(json["CA"]),
        es: json["ES"] == null ? null : Es.fromJson(json["ES"]),
        gb: json["GB"] == null ? null : Ca.fromJson(json["GB"]),
        ie: json["IE"] == null ? null : Ca.fromJson(json["IE"]),
        nz: json["NZ"] == null ? null : Ca.fromJson(json["NZ"]),
        pg: json["PG"] == null ? null : Ca.fromJson(json["PG"]),
        us: json["US"] == null ? null : Ca.fromJson(json["US"]),
    );

    Map<String, dynamic> toJson() => {
        "AU": au?.toJson(),
        "CA": ca?.toJson(),
        "ES": es?.toJson(),
        "GB": gb?.toJson(),
        "IE": ie?.toJson(),
        "NZ": nz?.toJson(),
        "PG": pg?.toJson(),
        "US": us?.toJson(),
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
        rent: json["rent"] == null ? [] : List<Buy>.from(json["rent"]!.map((x) => Buy.fromJson(x))),
        buy: json["buy"] == null ? [] : List<Buy>.from(json["buy"]!.map((x) => Buy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "rent": rent == null ? [] : List<dynamic>.from(rent!.map((x) => x.toJson())),
        "buy": buy == null ? [] : List<dynamic>.from(buy!.map((x) => x.toJson())),
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

class Ca {
    final String? link;
    final List<Buy>? buy;

    Ca({
        this.link,
        this.buy,
    });

    factory Ca.fromJson(Map<String, dynamic> json) => Ca(
        link: json["link"],
        buy: json["buy"] == null ? [] : List<Buy>.from(json["buy"]!.map((x) => Buy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "buy": buy == null ? [] : List<dynamic>.from(buy!.map((x) => x.toJson())),
    };
}

class Es {
    final String? link;
    final List<Buy>? rent;

    Es({
        this.link,
        this.rent,
    });

    factory Es.fromJson(Map<String, dynamic> json) => Es(
        link: json["link"],
        rent: json["rent"] == null ? [] : List<Buy>.from(json["rent"]!.map((x) => Buy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "rent": rent == null ? [] : List<dynamic>.from(rent!.map((x) => x.toJson())),
    };
}
