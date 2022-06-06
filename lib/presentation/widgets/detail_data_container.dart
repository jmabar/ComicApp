import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final String data;
  const DataContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(border: Border.all(color: Colors.black38), borderRadius: BorderRadius.circular(10.0)),
          child: const Icon(Icons.photo_camera, color: Colors.black26),
        ),
        const SizedBox(width: 12.0),
        Text(data, style: const TextStyle(color: Colors.green, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
