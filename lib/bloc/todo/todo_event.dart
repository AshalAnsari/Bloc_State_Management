import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodo extends TodoEvent {
  final String task;

  AddTodo({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTodo extends TodoEvent {
  final Object task;

  RemoveTodo({required this.task});

  @override
  List<Object?> get props => [task];
}
