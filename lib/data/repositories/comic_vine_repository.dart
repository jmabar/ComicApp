import 'package:comic_app/data/clients/comic_vine_client.dart';

import '../models/models.dart';

class ComicVineRepository {
  final ComicVineClient _comicVineClient;

  ComicVineRepository({ComicVineClient? comicVineClient}) : _comicVineClient = comicVineClient ?? ComicVineClient();

  //Returns list of issue objects
  Future<List<Issue>> getIssues(String limit) async {
    List<Issue> issues = [];

    final lastIssuesResponse = await _comicVineClient.fetchLastIssues(limit);

    for (final result in lastIssuesResponse.results) {
      final Issue issue = Issue.fromRepository(result);
      issues.add(issue);
    }

    return issues;
  }

  //Returns details specific to one issue
  Future<IssueDetail> getDetails(String apiDetailUrl) async {
    final issueDetailsResponse = await _comicVineClient.fetchIssueDetails(apiDetailUrl);

    final IssueDetail issueDetail = IssueDetail.fromRepository(issueDetailsResponse.result);

    return issueDetail;
  }
}
