import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/app/fooder/api/mock_api_service.dart';
import 'package:flutter_complete_guide/app/fooder/components/friend_post_list_view.dart';
import 'package:flutter_complete_guide/app/fooder/components/today_recipe_list_view.dart';

class FooderExploreScreen extends StatelessWidget {
  final mockApi = MockApi();
  FooderExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockApi.getFriendFeed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print('xxxxxxxx $snapshot');
          return ListView(
            scrollDirection: Axis.vertical,
            children: [TodayRecipeListView(), FriendPostListView()],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
