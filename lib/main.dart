import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/todo_list.dart';
import './widgets/new_todo.dart';
import './providers/Todos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("My App build");
    return ChangeNotifierProvider.value(
      value: Todos(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  void _showAddNewTodoForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(15.0),
          height: 200,
          child: NewTodo(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Home Page build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddNewTodoForm(context),
          ),
        ],
      ),
      body: TodoList(),
    );
  }
}
