part of 'list_rooms_bloc.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class ListRoomsState with _$ListRoomsState {
  const factory ListRoomsState({
    @Default([]) List<String> listRooms,
    String? room,
    String? messageError,
  }) = _ListRoomsState;
}
