part of 'typeview_bloc.dart';

abstract class TypeviewEvent extends Equatable {
  const TypeviewEvent();

  @override
  List<Object> get props => [];
}

class OnTypeviewListEvent extends TypeviewEvent {}

class OnTypeviewGridEvent extends TypeviewEvent {}

class OnLatestIssuesFetched extends TypeviewEvent {
  final List<Issue> issues;
  const OnLatestIssuesFetched(this.issues);
}

class OnFailureRequestEvent extends TypeviewEvent {
  final String? errorMsg;
  const OnFailureRequestEvent({this.errorMsg});
}
