import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/constants/styles.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/views/components/add_todo.dart';
import 'package:todo/views/components/app_bar.dart';
import 'package:todo/views/components/search_box.dart';
import 'package:todo/views/components/todo_item.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  final _todos = SplayTreeSet<Todo>();
  String _filter = "";
  final _filtered = <Todo>[];
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          SearchBox(onSearch: _applyFilter),
          Expanded(
            child: _buildList(),
          ),
          AddTodoWidget(
            onAdd: _addTodo,
            controller: _todoController,
          ),
        ],
      ),
    );
  }

  void _applyFilter(String value) {
    _filter = value.toLowerCase();
    _filtered.clear();
    if (_filter.isNotEmpty) {
      for (Todo todo in _todos) {
        if (todo.title.toLowerCase().contains(_filter)) {
          _filtered.add(todo);
        }
      }
    }
    setState(() {});
  }

  void _toggleTodo(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((Todo todo) => todo.id == id);
    });
  }

  void _addTodo() {
    setState(() {
      final String title = _todoController.text;
      if (title.isNotEmpty) {
        _todos.add(Todo.create(title));
        // Hides keyboard
        FocusManager.instance.primaryFocus?.unfocus();
      }
      _todoController.clear();
    });
  }

  Widget _buildList() {
    if (_filter.isEmpty && _todos.isEmpty) {
      return const Center(
        child: Text("No todos added, add one below"),
      );
    }
    Iterable todos = _todos;
    if (_filtered.isNotEmpty || _filter.isNotEmpty) {
      todos = _filtered;
    }
    if (todos.isEmpty) {
      return const Center(
        child: Text("No todos found"),
      );
    }
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        Todo todo = todos.elementAt(index);
        return TodoItem(
          key: Key(todo.id),
          todo: todo,
          onChange: _toggleTodo,
          onDelete: _deleteTodo,
        );
      },
      padding: const EdgeInsets.only(bottom: 10),
    );
  }
}
