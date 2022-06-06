import 'package:flutter/material.dart';

import '../../../util/constants.dart';
import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class MobileMainPage extends StatelessWidget {
  final List<Issue> issues;
  const MobileMainPage({Key? key, required this.issues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  const Text(
                    'Comic Book',
                    textAlign: TextAlign.center,
                  ),
                  const Text('Latest Issues'),
                  const Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  Expanded(child: IssuesListView(issues: issues))
                ]);
              } else {
                return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  const Text('Comic Book', textAlign: TextAlign.center),
                  const Text('Latest Issues'),
                  const Divider(
                    height: 2.0,
                    thickness: 2.0,
                  ),
                  Expanded(
                      child: IssuesGridView(
                    issues: issues,
                    crossAxisCount: 2,
                    mainAxisExtent: Constants.twoGridMainAxisExtent,
                  ))
                ]);
              }
            },
          ),
        ),
      ),
    );
  }
}
