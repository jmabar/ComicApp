import 'package:flutter/material.dart';

import '../../../util/constants.dart';
import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class MobileDetailPage extends StatelessWidget {
  final IssueDetail issueDetail;

  const MobileDetailPage({Key? key, required this.issueDetail}) : super(key: key);

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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...IssueDetailWidgetGenerator.generateTableContentWidgetOnePerRow('Characters', issueDetail.characterCredits),
                  ...IssueDetailWidgetGenerator.generateTableContentWidgetOnePerRow('Teams', issueDetail.personCredits),
                  ...IssueDetailWidgetGenerator.generateTableContentWidgetOnePerRow('Locations', issueDetail.locationCredits),
                  IssueImageWidget(
                    imageUrl: issueDetail.originImageUrl,
                    imageContainerHeight: Constants.listImageHeight,
                    imageContainerWidth: Constants.listImageWidth,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
