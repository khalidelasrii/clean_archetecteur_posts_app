import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Posts extends Equatable {
  final int id;
  final String title;
  final bool completed;

  Posts({required this.id, required this.title, required this.completed});

  @override
  List<Object?> get props => [id, title, completed];
}
