import 'package:comic_app/business_logic/blocs/detailview/detailview_bloc.dart';
import 'package:comic_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/connectivity/connectivity_bloc.dart';
import '../pages.dart';

//Wrapper Object for Detail Issue Page - Responsive desing and build given Bloc's States.
class DetailIssuePage extends StatefulWidget {
  final int issueId;
  const DetailIssuePage({Key? key, required this.issueId}) : super(key: key);

  @override
  State<DetailIssuePage> createState() => _DetailIssuePageState();
}

class _DetailIssuePageState extends State<DetailIssuePage> {
  late DetailviewBloc _detailviewBloc;

  @override
  void initState() {
    super.initState();
    _detailviewBloc = BlocProvider.of<DetailviewBloc>(context);
    _detailviewBloc.fetchIssueDetail(widget.issueId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      buildWhen: (previous, current) => previous.connectionStatus != current.connectionStatus,
      builder: (context, state) {
        if (state.connectionStatus == ConnectionStatus.disconnected) {
          return const NoConnectionPage();
        } else {
          return BlocBuilder<DetailviewBloc, DetailviewState>(
            builder: (context, state) {
              if (state.detailviewType == DetailviewType.loading) {
                return const LoadingPage(isDetailPage: true);
              } else if (state.detailviewType == DetailviewType.page) {
                return LayoutBuilder(
                  builder: ((context, constraints) {
                    if (constraints.maxWidth <= Constants.mobileIssueDetailPageMaxWidth) {
                      return MobileDetailPage(issueDetail: state.issueDetail!);
                    } else {
                      return WebDetailPage(issueDetail: state.issueDetail!);
                    }
                  }),
                );
              } else if (state.detailviewType == DetailviewType.failure) {
                return RequestFailurePage(errorMsg: state.errorMsg, isDetailPage: true);
              } else {
                return Container();
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _detailviewBloc.close();
    super.dispose();
  }
}
