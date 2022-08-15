import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/models.dart';
import 'package:flutter_complete_guide/syntax_code/circle_image.dart';

class FriendPostTile extends StatelessWidget {
  final Post post;
  const FriendPostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
          imageRadius: 20,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.comment),
            Text(
              '${post.timestamp} mins ago',
              style: TextStyle(fontWeight: FontWeight.w700),
            )
          ],
        ))
      ],
    );
  }
}
