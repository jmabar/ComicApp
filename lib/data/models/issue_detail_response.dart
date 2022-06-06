// To parse this JSON data, do
//
//     final issueDetailResponse = issueDetailResponseFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class IssueDetailResponse {
  IssueDetailResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.result,
    required this.version,
  });

  final String error;
  final int limit;
  final int offset;
  final int numberOfPageResults;
  final int numberOfTotalResults;
  final int statusCode;
  final DetailResult result;
  final String version;

  factory IssueDetailResponse.fromJson(String str) => IssueDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IssueDetailResponse.fromMap(Map<String, dynamic> json) => IssueDetailResponse(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        result: DetailResult.fromMap(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": result.toMap(),
        "version": version,
      };
}

class DetailResult {
  DetailResult({
    required this.characterCredits,
    required this.id,
    required this.image,
    required this.issueNumber,
    required this.locationCredits,
    required this.name,
    required this.personCredits,
  });
  final List<Character> characterCredits;
  final int id;
  final IssueImages image;
  final String issueNumber;
  final List<Location> locationCredits;
  final String? name;
  final List<Person> personCredits;

  factory DetailResult.fromJson(String str) => DetailResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailResult.fromMap(Map<String, dynamic> json) => DetailResult(
        characterCredits: List<Character>.from(json["character_credits"].map((x) => Character.fromMap(x))),
        id: json["id"],
        image: IssueImages.fromMap(json["image"]),
        issueNumber: json["issue_number"],
        locationCredits: List<Location>.from(json["location_credits"].map((x) => Location.fromMap(x))),
        name: json["name"] ?? 'No Name',
        personCredits: List<Person>.from(json["person_credits"].map((x) => Person.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "character_credits": List<dynamic>.from(characterCredits.map((x) => x.toMap())),
        "id": id,
        "image": image.toMap(),
        "issue_number": issueNumber,
        "location_credits": List<dynamic>.from(locationCredits.map((x) => x.toMap())),
        "name": name ?? 'No Name',
        "person_credits": List<dynamic>.from(personCredits.map((x) => x.toMap())),
      };
}
