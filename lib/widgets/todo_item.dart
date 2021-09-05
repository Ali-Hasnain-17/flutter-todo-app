import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/Todos.dart';
import '../providers/Todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem(this.todo);

  @override
  Widget build(BuildContext context) {
    print("Todo Item build");
    final todos = Provider.of<Todos>(context, listen: false);
    return ListTile(
      leading: Consumer<Todo>(
        builder: (context, todo, _) {
          print("Checkbox built");
          return Checkbox(
            value: todo.isSelected,
            onChanged: (_) => todo.toggleTodo(),
          );
        },
      ),
      title: Text(todo.title),
      subtitle: Text(
        DateFormat.yMd().add_jm().format(DateTime.now()),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => todos.deleteTodo(todo.id),
      ),
    );
  }
}
