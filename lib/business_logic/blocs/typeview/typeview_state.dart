part of 'typeview_bloc.dart';

enum LayoutTypeView { grid, list, loading, failure }

class TypeviewState extends Equatable {
  final LayoutTypeView layoutTypeView;
  final List<Issue> issues;
  final String errorMsg;

  const TypeviewState({required this.layoutTypeView, required this.issues, required this.errorMsg});

  @override
  List<Object> get props => [layoutTypeView, issues];

  TypeviewState copyWith({LayoutTypeView? layoutTypeView, List<Issue>? issues, String? errorMsg}) => TypeviewState(
        layoutTypeView: layoutTypeView ?? this.layoutTypeView,
        issues: issues ?? this.issues,
        errorMsg: errorMsg ?? this.errorMsg,
      );
}
