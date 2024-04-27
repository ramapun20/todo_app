import 'package:flutter/material.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<String> todos;
  final Function(int) onDelete;

  TodoList({required this.todos, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoItem(
          title: todos[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
