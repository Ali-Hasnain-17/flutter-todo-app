import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Todos.dart';

class NewTodo extends StatelessWidget {
  final _titleController = TextEditingController();

  void _submitInput(BuildContext context) {
    final todos = Provider.of<Todos>(context, listen: false);
    final title = _titleController.text;
    final id = DateTime.now().toString();
    if (title.isEmpty) return;
    todos.addTodo(id, title);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    print("New Todo build");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Title"),
          controller: _titleController,
          onSubmitted: (_) => _submitInput(context),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            child: Text("Add Todo"),
            onPressed: () => _submitInput(context),
          ),
        ),
      ],
    );
  }
}
