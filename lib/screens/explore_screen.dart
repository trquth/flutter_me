import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/api/mock_fooderlich_service.dart';
import 'package:flutter_complete_guide/components/friend_post_list_view.dart';
import 'package:flutter_complete_guide/components/today_recipe_list_view.dart';
import 'package:flutter_complete_guide/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                const SizedBox(
                  height: 16,
                ),
                FriendPostListView(
                  friendPosts: snapshot.data?.friendPosts ?? [],
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
    return Center(
      child: Container(
        child: const Text('Explore Screen'),
      ),
    );
  }
}
