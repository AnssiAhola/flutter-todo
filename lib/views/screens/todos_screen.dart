import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todos/todos_bloc.dart';
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
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          SearchBox(onSearch: _search),
          Expanded(child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state is TodosLoaded) {
                return _buildList(state.todos);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
          AddTodoWidget(
            onAdd: _addTodo,
            controller: _todoController,
          ),
        ],
      ),
    );
  }

  void _search(String searchTerm) {
    context.read<TodosBloc>().add(SearchTodos(searchTerm));
  }

  void _toggleTodo(Todo todo) {
    todo.toggleCompleted();
    context.read<TodosBloc>().add(UpdateTodo(todo: todo));
  }

  void _deleteTodo(Todo todo) {
    context.read<TodosBloc>().add(DeleteTodo(todo: todo));
  }

  void _addTodo() {
    final String title = _todoController.text;
    if (title.isNotEmpty) {
      context.read<TodosBloc>().add(AddTodo(todo: Todo.create(title)));
      // Hides keyboard
      FocusManager.instance.primaryFocus?.unfocus();
    }
    _todoController.clear();
  }

  Widget _buildList(SplayTreeSet<Todo> todos) {
    if (todos.isEmpty) {
      return const Center(child: Text("No todos found"));
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
