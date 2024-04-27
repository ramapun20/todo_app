import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  final TextEditingController todoController;
  final Function(String) onAdd;

  AddTodoDialog({required this.todoController, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add ToDo Item'),
      content: TextField(
        controller: todoController,
        decoration: InputDecoration(hintText: 'Enter your ToDo'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onAdd(todoController.text);
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
