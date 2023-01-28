import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:business_layout/business_layout.dart';
import 'package:data_layout/data_layout.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:models/models.dart';

part 'orders_to_fulfill_bloc.freezed.dart';

part 'orders_to_fulfill_event.dart';

part 'orders_to_fulfill_state.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

class OrdersToFulfillBloc
    extends Bloc<OrdersToFulfillEvent, OrdersToFulfillState> {
  final HomePageRepo _homePageRepo = HomePageRepo();

  OrdersToFulfillBloc() : super(OrdersToFulfillState()) {
    on<SetListOrdersToFulfillEvent>(_setListOrdersToFulfill);
    on<AddCheckOrders>(_addCheckOrders);
    on<AddCheckAllOrders>(_addCheckAllOrders);
    on<AddBarcodeFromScannerEvent>(_addBarcodeFromScannerEvent);
    on<AddProblemOrdersToFulfillEvent>(_addProblemOrdersToFulfillEvent);
    on<SendCompletedOrdersToTheServer>(_sendCompletedOrdersToTheServer);
  }

  Future<void> _setListOrdersToFulfill(SetListOrdersToFulfillEvent event,
      Emitter<OrdersToFulfillState> emit) async {
    emit(
      OrdersToFulfillState(
        isLoading: false,
        listOrdersToFulfill: event.listWithOrders,
      ),
    );
  }

  FutureOr<void> _addCheckOrders(
      AddCheckOrders event, Emitter<OrdersToFulfillState> emit) {
    emit(
      state.copyWith(
        listWithIdOrdersCheckOrdersToFulfill:
            event.listWithIdOrdersCheckOrdersToFulfill,
      ),
    );
  }

  FutureOr<void> _addCheckAllOrders(
      AddCheckAllOrders event, Emitter<OrdersToFulfillState> emit) {
    emit(
      state.copyWith(
        isCheckAll: event.isCheckAll,
        listWithIdOrdersCheckOrdersToFulfill: event.isCheckAll
            ? List.generate(state.listOrdersToFulfill.length,
                (index) => state.listOrdersToFulfill[index].id_order).toSet()
            : {},
      ),
    );
  }

  FutureOr<void> _addBarcodeFromScannerEvent(
      AddBarcodeFromScannerEvent event, Emitter<OrdersToFulfillState> emit) {
    emit(
      state.copyWith(
        barcodeText: event.barcodeText,
      ),
    );
  }

  Future<void> _addProblemOrdersToFulfillEvent(
      AddProblemOrdersToFulfillEvent event,
      Emitter<OrdersToFulfillState> emit) async {
    final responseServer = await _homePageRepo.addProblemOrder(
      location: event.location,
      userName: event.userName,
      password: event.password,
      problemOrder: event.problemOrder,
    );
    if (responseServer?.keys.first == 200) {
      final List<InfoOrderModel> _resRemovveListOrdersToFulfill =
          state.listOrdersToFulfill;
      final List<String> _resRemovveListWithIdOrdersCheckOrdersToFulfill =
          state.listWithIdOrdersCheckOrdersToFulfill.toList();
      _resRemovveListOrdersToFulfill.removeWhere(
          (element) => element.id_order == event.problemOrder.id_order);
      _resRemovveListWithIdOrdersCheckOrdersToFulfill
          .removeWhere((element) => element == event.problemOrder.id_order);
      emit(
        state.copyWith(
          listOrdersToFulfill: _resRemovveListOrdersToFulfill,
          listWithIdOrdersCheckOrdersToFulfill:
              _resRemovveListWithIdOrdersCheckOrdersToFulfill.toSet(),
        ),
      );
    } else {
      emit(
        state.copyWith(
          messageError: responseServer.toString(),
        ),
      );
    }
  }

  Future<void> _sendCompletedOrdersToTheServer(
      SendCompletedOrdersToTheServer event,
      Emitter<OrdersToFulfillState> emit) async {
    emit(
      state.copyWith(
        isSendingOnServer: true,
      ),
    );
    final responseServer = await _homePageRepo.sendCompletedOrdersToTheServer(
      location: event.location,
      userName: event.userName,
      password: event.password,
      listCompletedOrders: event.listCompletedOrders,
    );

    if (responseServer?.keys.first == 200) {
      final List<InfoOrderModel> _resRemovveListOrdersToFulfill =
          state.listOrdersToFulfill;
      event.listCompletedOrders.forEach((completedOrder) {
        _resRemovveListOrdersToFulfill
            .removeWhere((element) => element.id_order == completedOrder);
      });
      final balance =
          json.decode(responseServer!.values.single)["balance"].toString();
      print("balance $balance");

      emit(
        state.copyWith(
          listOrdersToFulfill: _resRemovveListOrdersToFulfill,
          listWithIdOrdersCheckOrdersToFulfill: {},
          isSendingOnServer: false,
          messageError: null,
          balance: balance,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isSendingOnServer: false,
          messageError: responseServer.toString(),
        ),
      );
    }
  }
}
