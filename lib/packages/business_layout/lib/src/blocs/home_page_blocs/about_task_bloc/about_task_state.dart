part of 'about_task_bloc.dart';

class ListAboutTasksInitialState {}

class LoadingListAboutTasksInitialState extends ListAboutTasksInitialState {}

class ListAboutTasksState extends ListAboutTasksInitialState {
  final Map<String, List<InfoOrderModel>> mapPlaceAndListInfoOrderModel;

  ListAboutTasksState({
    required this.mapPlaceAndListInfoOrderModel,
  });
}

class ErrorListAboutTasksInitialState extends ListAboutTasksInitialState {
  final String errorMessage;

  ErrorListAboutTasksInitialState({required this.errorMessage}) : super();
}
