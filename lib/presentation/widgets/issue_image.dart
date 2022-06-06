import 'package:flutter/material.dart';

class IssueImageWidget extends StatelessWidget {
  final String imageUrl;
  final double imageContainerHeight;
  final double imageContainerWidth;
  const IssueImageWidget({Key? key, required this.imageUrl, required this.imageContainerHeight, required this.imageContainerWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageContainerHeight,
      width: imageContainerWidth,
      decoration: BoxDecoration(border: Border.all(width: 2.0)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          } else {
            return const Icon(Icons.photo);
          }
        },
        errorBuilder: (context, object, stackTrace) {
          return const Icon(Icons.no_photography);
        },
      ),
    );
  }
}
