import 'package:bloc/bloc.dart';
import 'package:comic_app/data/models/models.dart';
import 'package:comic_app/data/repositories/comic_vine_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../data/clients/comic_vine_client.dart';

part 'typeview_event.dart';
part 'typeview_state.dart';

//Bloc to manage state for the MainIssuePage wrapper
class MainTypeviewBloc extends Bloc<TypeviewEvent, TypeviewState> {
  final ComicVineRepository _comicVineRepository;
  MainTypeviewBloc(this._comicVineRepository) : super(const TypeviewState(layoutTypeView: LayoutTypeView.loading, issues: [], errorMsg: '')) {
    on<OnTypeviewGridEvent>((event, emit) => emit(state.copyWith(layoutTypeView: LayoutTypeView.grid)));
    on<OnTypeviewListEvent>((event, emit) => emit(state.copyWith(layoutTypeView: LayoutTypeView.list)));
    on<OnFailureRequestEvent>((event, emit) => emit(state.copyWith(layoutTypeView: LayoutTypeView.failure, errorMsg: event.errorMsg)));
    on<OnLatestIssuesFetched>((event, emit) => emit(state.copyWith(layoutTypeView: LayoutTypeView.list, issues: event.issues)));
  }

  Future<void> fetchLastIssues() async {
    try {
      final List<Issue> lastIssues = await _comicVineRepository.getIssues('10');
      add(OnLatestIssuesFetched(lastIssues));
    } on IssuesRequestFailure catch (e) {
      add(OnFailureRequestEvent(errorMsg: e.errorMsg));
    } on Exception catch (e) {
      add(OnFailureRequestEvent(errorMsg: e.toString()));
    }
  }
}
