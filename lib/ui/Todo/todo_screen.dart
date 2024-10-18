import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_event.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          // print("Lenght: ${state.todoList.length}");
          if (state.todoList.isEmpty) {
            return Center(
              child: Text("No Tasks"),
            );
          } else {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${index + 1}"),
                    title: Text("${state.todoList[index]}"),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(RemoveTodo(task: state.todoList[index]));
                        },
                        icon: Icon(Icons.delete)),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("In here");
          context.read<TodoBloc>().add(AddTodo(task: 'Todo Task'));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
