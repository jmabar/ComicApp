import 'package:flutter/material.dart';

import '../../presentation/widgets/widgets.dart';

class IssueDetailWidgetGenerator {
  //Generates Widget to represent a table of IssueData objects with a title and a divider
  static List<Widget> generateTableContentWidgetSideBySide(String title, List<dynamic> issueDataObjects) {
    List<Widget> widgets = [];

    widgets.add(Text(title));
    widgets.add(const Divider(height: 2.0, thickness: 2.0));
    widgets.add(const SizedBox(height: 20.0));
    widgets.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...generateRowWidgetsSideBySide(issueDataObjects, true)],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...generateRowWidgetsSideBySide(issueDataObjects, false)],
        )
      ],
    ));

    return widgets;
  }

  static List<Widget> generateTableContentWidgetOnePerRow(String title, List<dynamic> issueDataObjects) {
    List<Widget> widgets = [];

    widgets.add(Text(title));
    widgets.add(const Divider(height: 2.0, thickness: 2.0));
    widgets.add(const SizedBox(height: 20.0));
    widgets.addAll(generateRowWidgetsOnePerRow(issueDataObjects));

    return widgets;
  }

  //Generates Row Widgets given a list of IssueData objects
  static List<Widget> generateRowWidgetsSideBySide(List<dynamic> issueDataObjects, bool isFirstColumn) {
    List<Widget> columnChildrens = [];
    if (isFirstColumn) {
      for (int i = 0; i < issueDataObjects.length; i += 2) {
        columnChildrens.add(DataContainer(data: issueDataObjects[i].name!));
        columnChildrens.add(const SizedBox(height: 8.0));
      }
      return columnChildrens;
    } else {
      for (int i = 1; i < issueDataObjects.length; i += 2) {
        columnChildrens.add(DataContainer(data: issueDataObjects[i].name!));
        columnChildrens.add(const SizedBox(height: 8.0));
      }
      return columnChildrens;
    }
    // for (int i = 0; i < issueDataObjects.length; i += 2) {
    //   final Widget rowWidget = Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       DataContainer(data: issueDataObjects[i].name!),
    //       (i + 1) < issueDataObjects.length ? DataContainer(data: issueDataObjects[i + 1].name!) : Container(),
    //     ],
    //   );

    //   rowsWidget.add(rowWidget);
    //   rowsWidget.add(const SizedBox(height: 12.0));
    // }

    // return rowsWidget;
  }

  static List<Widget> generateRowWidgetsOnePerRow(List<dynamic> issueDataObjects) {
    List<Widget> rowsWidget = [];
    for (int i = 0; i < issueDataObjects.length; i++) {
      final Widget rowWidget = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DataContainer(data: issueDataObjects[i].name!),
        ],
      );

      rowsWidget.add(rowWidget);
      rowsWidget.add(const SizedBox(height: 12.0));
    }

    return rowsWidget;
  }
}
