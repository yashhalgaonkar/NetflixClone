import 'package:flutter/material.dart';

import '../models/content_model.dart';

class Preview extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Preview({
    Key key,
    @required this.title,
    @required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
