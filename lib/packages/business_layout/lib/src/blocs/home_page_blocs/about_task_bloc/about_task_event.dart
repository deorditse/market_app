part of 'about_task_bloc.dart';

@immutable
abstract class AboutTaskEvent {}

class ResetAboutTasksInitialEvent extends AboutTaskEvent {}

class GetListAboutTasksEvent extends AboutTaskEvent {
  final String room;
  final String userName;
  final String password;
  final Location location;

  GetListAboutTasksEvent({
    required this.room,
    required this.userName,
    required this.password,
    required this.location,
  });
}

class AddNewBalanceAboutTasksInitialEvent extends AboutTaskEvent {
  final double newBalance;

  AddNewBalanceAboutTasksInitialEvent({required this.newBalance});
}
