import 'package:flutter/material.dart';
import 'package:todo_app/add_todo_dilog.dart';
import 'package:todo_app/todo_item.dart';
import 'package:todo_app/todo_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> todos = [];
  late TextEditingController _searchController;
  late List<String> _filteredTodos;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredTodos =
        todos; // Initialize filtered todos with all todos initially
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImage(imagePath: 'assets/rama.png')),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/rama.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _searchTodoList,
            ),
          ),
          Expanded(
            child: TodoList(
              todos: _filteredTodos,
              onDelete: _deleteTodoItem,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem() {
    TextEditingController todoController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTodoDialog(
          todoController: todoController,
          onAdd: (todo) {
            setState(() {
              todos.add(todo);
              _searchTodoList(_searchController
                  .text); // Update filtered todos after adding a new todo
            });
          },
        );
      },
    );
  }

  void _deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
      _searchTodoList(_searchController
          .text); // Update filtered todos after deleting a todo
    });
  }

  void _searchTodoList(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the query is empty, show all todos        _filteredTodos = todos;
      } else {
        // Filter todos based on the query
        _filteredTodos = todos
            .where((todo) => todo.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
