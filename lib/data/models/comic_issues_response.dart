// To parse this JSON data, do
//
//     final comicIssuesResponse = comicIssuesResponseFromMap(jsonString);

import 'dart:convert';

class ComicIssuesResponse {
  ComicIssuesResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final List<Result> results;
  final String version;

  factory ComicIssuesResponse.fromJson(String str) => ComicIssuesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComicIssuesResponse.fromMap(Map<String, dynamic> json) => ComicIssuesResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "version": version,
      };
}

class Result {
  Result({
    required this.apiDetailUrl,
    required this.dateAdded,
    required this.description,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.name,
    required this.siteDetailUrl,
  });

  final String apiDetailUrl;
  final String dateAdded;
  final String? description;
  final int id;
  final IssueImages image;
  final String issueNumber;
  final String? name;
  final String siteDetailUrl;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        apiDetailUrl: json["api_detail_url"],
        dateAdded: json["date_added"],
        description: json["description"] ?? 'No Description',
        id: json["id"],
        image: IssueImages.fromMap(json["image"]),
        issueNumber: json["issue_number"],
        name: json["name"] ?? 'No Name',
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl,
        "date_added": dateAdded,
        "description": description ?? "No description",
        "id": id,
        "image": image.toMap(),
        "issue_number": issueNumber,
        "name": name ?? 'No name',
        "site_detail_url": siteDetailUrl,
      };
}

class IssueImages {
  IssueImages({
    required this.iconUrl,
    required this.mediumUrl,
    required this.screenUrl,
    required this.screenLargeUrl,
    required this.smallUrl,
    required this.superUrl,
    required this.thumbUrl,
    required this.tinyUrl,
    required this.originalUrl,
  });

  final String iconUrl;
  final String mediumUrl;
  final String screenUrl;
  final String screenLargeUrl;
  final String smallUrl;
  final String superUrl;
  final String thumbUrl;
  final String tinyUrl;
  final String originalUrl;

  factory IssueImages.fromJson(String str) => IssueImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IssueImages.fromMap(Map<String, dynamic> json) => IssueImages(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
      );

  Map<String, dynamic> toMap() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
      };
}
