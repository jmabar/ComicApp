import '../models/models.dart';

class IssueDetail {
  final int id;
  final List<Character> characterCredits;
  final String originImageUrl;
  final List<Location> locationCredits;
  final String name;
  final List<Person> personCredits;

  IssueDetail({
    required this.id,
    required this.characterCredits,
    required this.originImageUrl,
    required this.locationCredits,
    required this.name,
    required this.personCredits,
  });

  factory IssueDetail.fromRepository(DetailResult detailResult) => IssueDetail(
        id: detailResult.id,
        characterCredits: detailResult.characterCredits,
        originImageUrl: detailResult.image.originalUrl,
        locationCredits: detailResult.locationCredits,
        name: detailResult.name!,
        personCredits: detailResult.personCredits,
      );
}
