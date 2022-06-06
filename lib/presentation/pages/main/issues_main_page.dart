import 'package:comic_app/util/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/connectivity/connectivity_bloc.dart';
import '../../../business_logic/blocs/typeview/typeview_bloc.dart';
import '../pages.dart';

//Wrapper Object for Main Issue Page - Responsive desing and build given Bloc's States.
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainTypeviewBloc _typeviewBloc;

  @override
  void initState() {
    super.initState();
    _typeviewBloc = BlocProvider.of<MainTypeviewBloc>(context);
    _typeviewBloc.fetchLastIssues();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      buildWhen: (previous, current) => previous.connectionStatus != current.connectionStatus,
      builder: (context, state) {
        if (state.connectionStatus == ConnectionStatus.disconnected) {
          return const NoConnectionPage();
        } else {
          return BlocBuilder<MainTypeviewBloc, TypeviewState>(
            buildWhen: (previous, current) => previous.layoutTypeView != current.layoutTypeView,
            builder: (context, state) {
              if (state.layoutTypeView == LayoutTypeView.loading) {
                return const LoadingPage(isDetailPage: false);
              } else if (state.layoutTypeView == LayoutTypeView.grid || state.layoutTypeView == LayoutTypeView.list) {
                return LayoutBuilder(
                  builder: ((context, constraints) {
                    if (constraints.maxWidth <= Constants.mobileMainPageMaxWidth) {
                      return MobileMainPage(issues: state.issues);
                    } else if (constraints.maxWidth > Constants.mobileMainPageMaxWidth && constraints.maxWidth <= Constants.tableMainPageMaxWidth) {
                      return TableMainPage(issues: state.issues);
                    } else {
                      return WebMainPage(issues: state.issues);
                    }
                  }),
                );
              } else {
                return RequestFailurePage(errorMsg: state.errorMsg, isDetailPage: false);
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _typeviewBloc.close();
    super.dispose();
  }
}
