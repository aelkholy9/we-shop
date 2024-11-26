import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String title;
  const Failure(this.title);

  @override
  List<Object?> get props => [title];
}
