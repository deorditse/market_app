import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:data_layout/data_layout.dart';
import 'package:models/models.dart';

part 'about_task_event.dart';

part 'about_task_state.dart';

class AboutTaskBlocs extends Bloc<AboutTaskEvent, ListAboutTasksInitialState> {
  final HomePageRepo _homePageRepo = HomePageRepo();

  AboutTaskBlocs() : super(ListAboutTasksInitialState()) {
    on<GetListAboutTasksEvent>(_getListAboutTasks);
    on<ResetAboutTasksInitialEvent>(_resetAboutTasksInitialEvent);
    on<AddNewBalanceAboutTasksInitialEvent>(
        _addNewBalanceAboutTasksInitialEvent);
  }

  Future<void> _getListAboutTasks(GetListAboutTasksEvent event,
      Emitter<ListAboutTasksInitialState> emit) async {
    emit(LoadingListAboutTasksInitialState());
    final responseServer = await _homePageRepo.getListTasks(
      location: event.location,
      userName: event.userName,
      password: event.password,
      roomName: event.room,
    );
    if (responseServer?.keys.first == 200) {
      List<InfoOrderModel> listAboutTasks =
          List<InfoOrderModel>.from(responseServer!.values.first);
      if (listAboutTasks.isNotEmpty) {
        Map<String, List<InfoOrderModel>> mapPlaceAndListInfoOrderModel = {};

        for (var infoOrder in listAboutTasks) {
          if (mapPlaceAndListInfoOrderModel[infoOrder.place] != null &&
              mapPlaceAndListInfoOrderModel[infoOrder.place]!.isNotEmpty) {
            mapPlaceAndListInfoOrderModel[infoOrder.place]!.add(infoOrder);
          } else {
            mapPlaceAndListInfoOrderModel[infoOrder.place] = [infoOrder];
          }
          emit(
            ListAboutTasksState(
              mapPlaceAndListInfoOrderModel: mapPlaceAndListInfoOrderModel,
            ),
          );
        }
      } else {
        emit(
          ListAboutTasksState(
            mapPlaceAndListInfoOrderModel: {},
          ),
        );
      }
    } else if (responseServer?.keys.first == 400) {
      emit(
        ListAboutTasksState(
          mapPlaceAndListInfoOrderModel: {},
        ),
      );
    } else {
      emit(
        ErrorListAboutTasksInitialState(
          errorMessage: responseServer.toString(),
        ),
      );
    }
  }

  FutureOr<void> _resetAboutTasksInitialEvent(ResetAboutTasksInitialEvent event,
      Emitter<ListAboutTasksInitialState> emit) {
    emit(ListAboutTasksInitialState());
  }

  FutureOr<void> _addNewBalanceAboutTasksInitialEvent(
    AddNewBalanceAboutTasksInitialEvent event,
    Emitter<ListAboutTasksInitialState> emit,
  ) {
    emit(
      ListAboutTasksState(
        mapPlaceAndListInfoOrderModel: {},
      ),
    );
  }
}
