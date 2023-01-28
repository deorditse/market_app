import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:models/models.dart';

part 'list_rooms_event.dart';

part 'list_rooms_bloc.freezed.dart';

part 'list_rooms_state.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
class ListRoomsBloc extends Bloc<ListRoomsEvent, ListRoomsState> {
  final HomePageRepo _homePageRepo = HomePageRepo();

  ListRoomsBloc() : super(ListRoomsState()) {
    on<GetListRoomsEvent>(_getListRooms);
    on<ChangeRoomsEvent>(_changeRoom);
  }

  Future<void> _getListRooms(
      GetListRoomsEvent event, Emitter<ListRoomsState> emit) async {
    ///заготовка на будущее если этот список буду получать из базы
    Map<int, dynamic>? responseFromServer = await _homePageRepo.getListRooms(
      location: event.location,
      userName: event.userName,
      password: event.password,
    );

    if (responseFromServer?.keys.first == 200) {
      List<String> listRooms = List<String>.from(
          await json.decode(responseFromServer!.values.first.toString()));
      emit(
        ListRoomsState(
          listRooms: listRooms,
          room: listRooms.first,
        ),
      );
    } else {
      emit(state.copyWith(messageError: responseFromServer.toString()));
    }
  }

  FutureOr<void> _changeRoom(
      ChangeRoomsEvent event, Emitter<ListRoomsState> emit) {
    emit(state.copyWith(room: event.room));
  }
}
