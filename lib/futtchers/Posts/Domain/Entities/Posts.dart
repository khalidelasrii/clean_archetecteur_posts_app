import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Posts extends Equatable {
  final int id;
  final String title;
  final String body;

  const Posts({required this.id, required this.title, required this.body, required });

  @override
  List<Object?> get props => [id, title, body];
}
