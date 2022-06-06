part of 'detailview_bloc.dart';

abstract class DetailviewEvent extends Equatable {
  const DetailviewEvent();

  @override
  List<Object> get props => [];
}

class OnAddIssueDetailEvent extends DetailviewEvent {
  final IssueDetail issueDetail;
  const OnAddIssueDetailEvent({required this.issueDetail});
}

class OnRequestFailureEvent extends DetailviewEvent {
  final String errorMsg;
  const OnRequestFailureEvent({required this.errorMsg});
}
