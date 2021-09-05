import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Todos.dart';
import './todo_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Todo List build");
    final todos = Provider.of<Todos>(context).todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: todos[index],
          child: TodoItem(todos[index]),
        );
      },
    );
  }
}
