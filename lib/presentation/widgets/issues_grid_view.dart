import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/constants.dart';
import '../../data/models/models.dart';
import '../pages/pages.dart';
import 'widgets.dart';
import '../../business_logic/blocs/detailview/detailview_bloc.dart';
import '../../data/repositories/comic_vine_repository.dart';

class IssuesGridView extends StatelessWidget {
  final int crossAxisCount;
  final double mainAxisExtent;
  final List<Issue> issues;
  const IssuesGridView({Key? key, required this.crossAxisCount, required this.mainAxisExtent, required this.issues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: GridView.builder(
        itemCount: issues.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0, mainAxisExtent: mainAxisExtent),
        itemBuilder: (BuildContext context, int i) {
          return IssueCustomGridTile(issue: issues[i]);
        },
      ),
    );
  }
}

class IssueCustomGridTile extends StatelessWidget {
  final Issue issue;
  const IssueCustomGridTile({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => BlocProvider(
                      create: (context) => DetailviewBloc(ComicVineRepository()),
                      child: DetailIssuePage(issueId: issue.id),
                    )),
              ),
            ),
            child: IssueImageWidget(
              imageUrl: issue.originImageUrl,
              imageContainerHeight: Constants.fourGridImageHeight,
              imageContainerWidth: Constants.fourGridImageWidth,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          '${issue.name} - ${issue.number}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        Text(
          issue.formattedDate,
          style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
        )
      ],
    );
  }
}
