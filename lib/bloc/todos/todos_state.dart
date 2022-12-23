part of 'todos_bloc.dart';

abstract class TodosState {
  const TodosState();
}

class TodosLoading extends TodosState {}

class TodosLoaded extends TodosState {
  final SplayTreeSet<Todo> todos;
  const TodosLoaded({required this.todos});
}
