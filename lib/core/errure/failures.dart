import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFaillure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFaillure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFaillure extends Failure {
  @override
  List<Object?> get props => [];
}
