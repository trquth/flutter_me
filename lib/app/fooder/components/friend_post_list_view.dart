import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/components/friend_post_title.dart';

class FriendPostListView extends StatelessWidget {
  const FriendPostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs 👩‍🍳',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemCount: 1000,
            itemBuilder: (context, index) {
              return const FriendPostTitle();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
