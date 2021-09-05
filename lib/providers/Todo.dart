import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  final String id;
  final String title;
  bool isSelected;

  Todo({@required this.id, @required this.title, this.isSelected = false});

  void toggleTodo() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
