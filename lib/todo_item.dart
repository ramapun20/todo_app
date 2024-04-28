import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;
  final Function(String) onEdit;

  TodoItem({required this.title, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _editTodoItem(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ), // Added the closing parenthesis here
    );
  }

  void _editTodoItem(BuildContext context) {
    TextEditingController editedTextController =
        TextEditingController(text: title);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit ToDo Item'),
          content: TextField(
            controller: editedTextController,
            decoration: InputDecoration(hintText: 'Edit your ToDo'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onEdit(editedTextController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
