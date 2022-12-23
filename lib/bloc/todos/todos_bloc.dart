import 'dart:async';
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final cache = SplayTreeSet<Todo>();

  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<SearchTodos>(_onSearchTodos);
  }

  FutureOr<void> _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    cache.addAll(event.todos);
    emit(TodosLoaded(todos: event.todos));
  }

  FutureOr<void> _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    if (state is TodosLoaded) {
      cache.add(event.todo);
      emit(TodosLoaded(todos: cache));
    }
  }

  FutureOr<void> _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) {
    if (state is TodosLoaded) {
      cache.removeWhere(((todo) => todo.id == event.todo.id));
      emit(TodosLoaded(todos: cache));
    }
  }

  FutureOr<void> _onUpdateTodo(UpdateTodo event, Emitter<TodosState> emit) {
    if (state is TodosLoaded) {
      cache.removeWhere(((todo) => todo.id == event.todo.id));
      cache.add(event.todo);
      emit(TodosLoaded(todos: cache));
    }
  }

  FutureOr<void> _onSearchTodos(SearchTodos event, Emitter<TodosState> emit) {
    final searchTerm = event.searchTerm.toLowerCase();
    if (searchTerm.isEmpty) {
      emit(TodosLoaded(todos: cache));
    } else if (state is TodosLoaded) {
      emit(TodosLoaded(
        todos: SplayTreeSet<Todo>.from(cache.where(
          (todo) => todo.title.toLowerCase().contains(searchTerm),
        )),
      ));
    }
  }
}
