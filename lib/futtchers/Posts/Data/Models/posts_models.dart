import 'package:clean_archetecteur_pasts_app/futtchers/Posts/Domain/Entities/Posts.dart';

class PostModels extends Posts {
  PostModels({
    required int id,
    required String title,
    required bool completed,
  }) : super(id: id, title: title, completed: completed);

  factory PostModels.fromJson(Map<String, dynamic> json) {
    return PostModels(
        id: json['id'], title: json['title'], completed: json['completed']);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
