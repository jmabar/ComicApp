import 'package:http/http.dart' as http;

import '../models/models.dart';

//Exception when Issues Request fails
class IssuesRequestFailure implements Exception {
  final String errorMsg;
  final int errorCode;
  IssuesRequestFailure({required this.errorMsg, required this.errorCode});
}

class DetailIssueRequestFailure implements Exception {
  final String errorMsg;
  final int errorCode;
  DetailIssueRequestFailure({required this.errorMsg, required this.errorCode});
}

//API Client that wraps the ComicVine API
class ComicVineClient {
  static const String _baseUrl = 'comicvine.gamespot.com';
  static const String _apiKey = '94f2b8094d2a84781fad84d3585e8311bca8087e';
  static const String _format = 'json';
  final http.Client _httpClient;

  ComicVineClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  //Fetches a list of issues sorted by date_added, given the limit parameter as the quantity to fetch.
  Future<ComicIssuesResponse> fetchLastIssues(String limit) async {
    final Map<String, String> queryParams = {'limit': limit, 'sort': 'date_added:desc', 'api_key': _apiKey, 'format': _format};

    final Uri issuesRequest = Uri.https(_baseUrl, '/api/issues', queryParams);

    final http.Response issuesResponse = await _httpClient.get(issuesRequest);

    if (issuesResponse.statusCode != 200) {
      throw IssuesRequestFailure(errorMsg: 'Failed issues fetch', errorCode: issuesResponse.statusCode);
    }

    final ComicIssuesResponse comicIssuesResponse = ComicIssuesResponse.fromJson(issuesResponse.body);

    if (comicIssuesResponse.statusCode != 1) {
      throw IssuesRequestFailure(errorMsg: 'Failed issues fetch: ${comicIssuesResponse.error}', errorCode: comicIssuesResponse.statusCode);
    }

    return comicIssuesResponse;
  }

  //Fetches Details for an Issue, given the detailed api url for that Issue in particular
  //For a particular issue, endpoint is composed of code '4000-' + Issue's ID.
  Future<IssueDetailResponse> fetchIssueDetails(String issueId) async {
    final Map<String, String> queryParams = {'api_key': _apiKey, 'format': _format};

    final issueDetailRequest = Uri.https(_baseUrl, '/api/issue/4000-$issueId', queryParams);

    final issueDetailResponse = await _httpClient.get(issueDetailRequest);

    if (issueDetailResponse.statusCode != 200) {
      throw DetailIssueRequestFailure(errorMsg: 'Failed issue detail fetch', errorCode: issueDetailResponse.statusCode);
    }

    final IssueDetailResponse issueDetails = IssueDetailResponse.fromJson(issueDetailResponse.body);

    if (issueDetails.statusCode != 1) {
      throw DetailIssueRequestFailure(errorMsg: 'Failed issues fetch: ${issueDetails.error}', errorCode: issueDetails.statusCode);
    }

    return issueDetails;
  }
}
