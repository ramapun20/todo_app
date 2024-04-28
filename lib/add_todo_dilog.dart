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
            String todoText = todoController.text
                .trim(); // Remove leading and trailing whitespaces
            if (todoText.isNotEmpty) {
              // Check if the todo text is not empty
              onAdd(todoText); // Add the todo item only if it's not empty
              Navigator.of(context).pop();
            } else {
              // Show a message or provide feedback to the user about empty todo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please enter a  todo item.'),
                ),
              );
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
