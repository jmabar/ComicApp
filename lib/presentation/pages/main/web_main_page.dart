import 'package:comic_app/presentation/pages/loading_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/typeview/typeview_bloc.dart';
import '../../../data/models/models.dart';
import '../../../util/constants.dart';
import '../../widgets/widgets.dart';

class WebMainPage extends StatelessWidget {
  final List<Issue> issues;
  const WebMainPage({Key? key, required this.issues}) : super(key: key);

  Widget _typeLayoutButtons(bool isList, MainTypeviewBloc typeviewBloc) {
    return Row(
      children: [
        IconWithText(
          iconData: Icons.list,
          text: 'List',
          onPressed: () => typeviewBloc.add(OnTypeviewListEvent()),
          color: isList ? Colors.green : Colors.black,
        ),
        IconWithText(
          iconData: Icons.grid_view,
          text: 'Grid',
          onPressed: () => typeviewBloc.add(OnTypeviewGridEvent()),
          color: isList ? Colors.black : Colors.green,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final MainTypeviewBloc typeviewBloc = BlocProvider.of<MainTypeviewBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            children: [
              const Center(
                child: Text('Comic Book'),
              ),
              Row(
                children: [
                  const Text('Latest Issues'),
                  const Spacer(),
                  BlocBuilder<MainTypeviewBloc, TypeviewState>(
                    builder: (context, state) {
                      if (state.layoutTypeView == LayoutTypeView.list) {
                        return _typeLayoutButtons(true, typeviewBloc);
                      } else if (state.layoutTypeView == LayoutTypeView.grid) {
                        return _typeLayoutButtons(false, typeviewBloc);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
              const Divider(height: 2.0, thickness: 2.0),
              Expanded(child: BlocBuilder<MainTypeviewBloc, TypeviewState>(
                builder: (context, state) {
                  if (state.layoutTypeView == LayoutTypeView.list) {
                    return IssuesListView(issues: issues);
                  } else if (state.layoutTypeView == LayoutTypeView.grid) {
                    return IssuesGridView(issues: issues, crossAxisCount: 4, mainAxisExtent: Constants.fourGridMainAxisExtent);
                  } else {
                    return const LoadingPage(isDetailPage: false);
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
