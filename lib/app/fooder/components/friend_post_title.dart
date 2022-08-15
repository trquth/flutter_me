import 'package:flutter/material.dart';

class FriendPostTitle extends StatelessWidget {
  const FriendPostTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 24,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/fooder/author_katz.jpeg'),
            radius: 20,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Made delicious creamy, shrimp black pepper pasta."),
            Text(
              "80 mins ago",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ))
      ],
    );
  }
}
