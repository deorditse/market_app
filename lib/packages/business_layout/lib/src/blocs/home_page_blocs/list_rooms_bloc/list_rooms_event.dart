part of 'list_rooms_bloc.dart';

@immutable
abstract class ListRoomsEvent {}

class GetListRoomsEvent extends ListRoomsEvent {
  final String userName;
  final String password;
  final Location location;

  GetListRoomsEvent({
    required this.userName,
    required this.password,
    required this.location,
  });
}

class ChangeRoomsEvent extends ListRoomsEvent {
  final String room;

  ChangeRoomsEvent({required this.room});
}
