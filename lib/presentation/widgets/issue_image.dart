import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

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
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Icon(Icons.photo),
        errorWidget: (context, url, error) => const Icon(Icons.no_photography),
      ),
    );
  }
}
