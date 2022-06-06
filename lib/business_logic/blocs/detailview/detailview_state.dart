part of 'detailview_bloc.dart';

enum DetailviewType { loading, failure, page }

class DetailviewState extends Equatable {
  final DetailviewType detailviewType;
  final String errorMsg;
  final IssueDetail? issueDetail;
  const DetailviewState({required this.detailviewType, required this.errorMsg, this.issueDetail});

  DetailviewState copyWith({DetailviewType? detailviewType, String? errorMsg, IssueDetail? issueDetail}) =>
      DetailviewState(detailviewType: detailviewType ?? this.detailviewType, errorMsg: errorMsg ?? this.errorMsg, issueDetail: issueDetail ?? this.issueDetail);

  @override
  List<Object> get props => [detailviewType, errorMsg];
}
