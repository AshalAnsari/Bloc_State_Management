import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_event.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodo>(addTodo);
    on<RemoveTodo>(removeTodo);
  }

  void addTodo(AddTodo event, Emitter<TodoState> emit) {
    todoList.add(event.task);
    // print("Todo: ${todoList.length}");
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    todoList.remove(event.task);
    // print("Todo: ${todoList.length}");
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
