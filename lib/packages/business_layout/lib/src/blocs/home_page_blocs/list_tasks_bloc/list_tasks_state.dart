part of 'list_tasks_bloc.dart';

@immutable
abstract class ListTasksState {}

class ListTasksInitialState extends ListTasksState {}

class ListTasksLoadedState extends ListTasksState {
  final List<String> listTasks;

  ///todo model
  ListTasksLoadedState({required this.listTasks});
}
