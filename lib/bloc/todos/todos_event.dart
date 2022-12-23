part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodosEvent {
  final SplayTreeSet<Todo> todos;

  const LoadTodos({required this.todos});

  @override
  List<Object> get props => [todos];
}

class SearchTodos extends TodosEvent {
  final String searchTerm;
  const SearchTodos(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}

class AddTodo extends TodosEvent {
  final Todo todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class UpdateTodo extends TodosEvent {
  final Todo todo;
  const UpdateTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodosEvent {
  final Todo todo;
  const DeleteTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}
