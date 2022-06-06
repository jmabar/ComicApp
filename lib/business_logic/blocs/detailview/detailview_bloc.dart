import 'package:bloc/bloc.dart';
import 'package:comic_app/data/clients/comic_vine_client.dart';
import 'package:comic_app/data/repositories/comic_vine_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:comic_app/data/models/models.dart';

part 'detailview_event.dart';
part 'detailview_state.dart';

//Bloc to manage state for the DetailIssuePage wrapper
class DetailviewBloc extends Bloc<DetailviewEvent, DetailviewState> {
  final ComicVineRepository _comicVineRepository;
  DetailviewBloc(this._comicVineRepository) : super(const DetailviewState(detailviewType: DetailviewType.loading, errorMsg: '', issueDetail: null)) {
    on<OnAddIssueDetailEvent>((event, emit) => emit(state.copyWith(issueDetail: event.issueDetail, detailviewType: DetailviewType.page)));
    on<OnRequestFailureEvent>((event, emit) => emit(state.copyWith(errorMsg: event.errorMsg, detailviewType: DetailviewType.failure)));
  }

  Future<void> fetchIssueDetail(String apiDetailUrl) async {
    try {
      final IssueDetail issueDetail = await _comicVineRepository.getDetails(apiDetailUrl);
      add(OnAddIssueDetailEvent(issueDetail: issueDetail));
    } on IssuesRequestFailure catch (e) {
      add(OnRequestFailureEvent(errorMsg: e.errorMsg));
    } on Exception catch (e) {
      add(OnRequestFailureEvent(errorMsg: e.toString()));
    }
  }
}
