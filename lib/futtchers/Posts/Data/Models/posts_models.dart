import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';

class PostModels extends Posts {
  PostModels({
    required int id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  factory PostModels.fromJson(Map<String, dynamic> json) {
    return PostModels(
        id: json['id'], title: json['title'], body: json['body']);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
