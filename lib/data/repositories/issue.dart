import 'package:intl/intl.dart';

import '../models/models.dart';

class Issue {
  final int id;
  final String name;
  final String number;
  final String date;
  final String apiDetailUrl;
  late String formattedDate;
  final String originImageUrl;

  Issue({
    required this.id,
    required this.name,
    required this.number,
    required this.date,
    required this.originImageUrl,
    required this.apiDetailUrl,
  }) {
    formattedDate = DateFormat.yMMMMd('en_US').format(DateTime.parse(date));
  }

  factory Issue.fromRepository(Result result) => Issue(
        id: result.id,
        name: result.name!,
        number: result.issueNumber,
        date: result.dateAdded,
        originImageUrl: result.image.originalUrl,
        apiDetailUrl: result.apiDetailUrl,
      );
}
