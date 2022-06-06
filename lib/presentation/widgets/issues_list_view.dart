import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/blocs/detailview/detailview_bloc.dart';
import '../../data/repositories/comic_vine_repository.dart';
import '../../util/constants.dart';
import '../../data/models/models.dart';
import '../pages/pages.dart';
import 'widgets.dart';

class IssuesListView extends StatelessWidget {
  final List<Issue> issues;
  const IssuesListView({Key? key, required this.issues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return IssueCustomListTile(issue: issues[i]);
        },
        itemCount: issues.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class IssueCustomListTile extends StatelessWidget {
  final Issue issue;
  const IssueCustomListTile({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              imageContainerWidth: Constants.fourGridImageWidth,
              imageContainerHeight: Constants.fourGridImageHeight,
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Column(
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
                  child: Text(
                    '${issue.name} - ${issue.number}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                issue.formattedDate,
                style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
