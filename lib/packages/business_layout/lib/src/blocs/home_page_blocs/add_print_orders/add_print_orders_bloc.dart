import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_layout/data_layout.dart';
import 'package:meta/meta.dart';
import 'package:models/models.dart';

part 'add_print_orders_event.dart';

part 'add_print_orders_state.dart';

class AddPrintOrdersBloc
    extends Bloc<AddNewPrintOrdersEvent, AddPrintOrdersState> {
  final HomePageRepo _homePageRepo = HomePageRepo();

  AddPrintOrdersBloc() : super(AddPrintOrdersInitial()) {
    on<AddNewPrintOrdersEvent>(_addNewPrintOrdersEvent);
  }

  Future<FutureOr<void>> _addNewPrintOrdersEvent(
      AddNewPrintOrdersEvent event, Emitter<AddPrintOrdersState> emit) async {
    if (event.listIdOrders.isEmpty) {
      emit(ErrorPrintOrdersState(messageError: "Выберите позиции для печати"));
    } else {
      emit(LoadingPrintOrdersState());
      final responseServer = await _homePageRepo.addPrintOrders(
        location: event.location,
        userName: event.userName,
        password: event.password,
        listIdOrders: event.listIdOrders,
      );
      if (responseServer?.keys.first == 200) {
        emit(LoadedPrintOrdersState());
      } else {
        emit(ErrorPrintOrdersState(messageError: "Ошибка печати"));
      }
    }
  }
}
