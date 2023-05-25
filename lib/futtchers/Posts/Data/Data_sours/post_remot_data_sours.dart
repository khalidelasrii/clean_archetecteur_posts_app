import 'dart:convert';
import 'dart:html';

import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Data/Models/posts_models.dart';
import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errure/exeption.dart';

abstract class PostRemotDataSours {
  Future<List<PostModels>> GettAllPosts();
  Future<Unit> DeletPost(int postId);
  Future<Unit> UpdatPost(PostModels postModels);
  Future<Unit> AddPost(PostModels postModels);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemotDataSours {
  final http.Client client;

  PostRemoteDataSourceImpl(this.client);

  @override
  Future<List<PostModels>> GettAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts/"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModels> postModels = decodedJson
          .map<PostModels>(
              (jsonPostModel) => PostModels.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Unit> AddPost(PostModels postModels) async {
    final body = {
      "title": postModels.title,
      "body": postModels.body,
    };
    final response =
        await client.post(Uri.parse("$BASE_URL/posts/"), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Unit> DeletPost(int postId) async {
    final response = await client.delete(
      Uri.parse("$BASE_URL/posts/${postId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Unit> UpdatPost(PostModels postModels) async {
    final postId = postModels.id.toString();
    final body = {
      "title": postModels.title,
      "body": postModels.body,
    };
    final response =
        await client.patch(Uri.parse("$BASE_URL/posts/$postId"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit );
    } else {
      throw ServerExeption();
    }
  }
}
