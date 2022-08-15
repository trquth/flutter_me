import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/app/fooder/model/post.dart';

class MockApi {
  Future<String> loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  Future<List<Post>> getFriendFeed() async {
    try {
      await Future.delayed(const Duration(microseconds: 1000));
      final dataString =
          await loadAsset('assets/sample_data/sample_friends_feed.json');
      final Map<String, dynamic> json = jsonDecode(dataString);
      if (json['feed'] != null) {
        final posts = <Post>[];
        json['feed'].forEach((v) {
          posts.add(Post.fromJson(v));
        });
        return posts;
      } else {
        return [];
      }
    } catch (e) {}
    return [];
  }
}
