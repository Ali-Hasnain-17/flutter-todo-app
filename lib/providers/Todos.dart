import './Todo.dart';
import 'package:flutter/foundation.dart';

class Todos with ChangeNotifier {
  final List<Todo> todos = [
    Todo(id: "T1", title: "Todo 1"),
    Todo(id: "T2", title: "Todo 2"),
    Todo(id: "T3", title: "Todo 3"),
  ];

  void addTodo(String id, String title) {
    final newTodo = Todo(
      id: id,
      title: title,
    );
    todos.add(newTodo);
    notifyListeners();
  }

  void deleteTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
