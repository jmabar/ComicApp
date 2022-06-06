import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class WebDetailPage extends StatelessWidget {
  final IssueDetail issueDetail;
  const WebDetailPage({Key? key, required this.issueDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text('Comic Book', style: TextStyle(color: Colors.black)),
            elevation: 0,
            leading: const DetailBackButton(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ...IssueDetailWidgetGenerator.generateTableContentWidgetSideBySide('Characters', issueDetail.characterCredits),
                        ...IssueDetailWidgetGenerator.generateTableContentWidgetSideBySide('Teams', issueDetail.personCredits),
                        ...IssueDetailWidgetGenerator.generateTableContentWidgetSideBySide('Locations', issueDetail.locationCredits),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: Image.network(issueDetail.originImageUrl, fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
