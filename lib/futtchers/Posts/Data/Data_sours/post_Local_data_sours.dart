import 'dart:convert';

import 'package:clean_archetecteur_pasts_app/core/errure/exeption.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSours {
  Future<List<PostModels>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModels> postModels);
}

const CACHED_POSTS = "CACHED_POSTS";

class PostLocalDataSourceImpl implements PostLocalDataSours {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachePosts(List<PostModels> postModels) {
    List PostModelsToJson = postModels
        .map<Map<String, dynamic>>((postModels) => postModels.tojson())
        .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(PostModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModels>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<PostModels> jsonToPostModels = decodeJsonData
          .map<PostModels>(
              (jsonPostModel) => PostModels.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheExeption();
    }
  }
}
