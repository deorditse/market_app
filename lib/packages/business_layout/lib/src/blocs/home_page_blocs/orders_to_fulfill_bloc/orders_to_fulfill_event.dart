part of 'orders_to_fulfill_bloc.dart';

@immutable
abstract class OrdersToFulfillEvent {}

class SetListOrdersToFulfillEvent extends OrdersToFulfillEvent {
  final List<InfoOrderModel> listWithOrders;

  SetListOrdersToFulfillEvent({required this.listWithOrders});
}

class AddCheckOrders extends OrdersToFulfillEvent {
  AddCheckOrders({
    this.listWithIdOrdersCheckOrdersToFulfill = const {},
  });

  final Set<String> listWithIdOrdersCheckOrdersToFulfill;
}

class AddCheckAllOrders extends OrdersToFulfillEvent {
  AddCheckAllOrders({
    this.isCheckAll = false,
  });

  final bool isCheckAll;
}

class AddBarcodeFromScannerEvent extends OrdersToFulfillEvent {
  AddBarcodeFromScannerEvent({
    required this.barcodeText,
  });

  final String barcodeText;
}

class AddProblemOrdersToFulfillEvent extends OrdersToFulfillEvent {
  final InfoOrderModel problemOrder;
  final String userName;
  final String password;
  final Location location;

  AddProblemOrdersToFulfillEvent({
    required this.problemOrder,
    required this.userName,
    required this.password,
    required this.location,
  });
}

class SendCompletedOrdersToTheServer extends OrdersToFulfillEvent {
  final List<String> listCompletedOrders;
  final String userName;
  final String password;
  final Location location;

  SendCompletedOrdersToTheServer({
    required this.listCompletedOrders,
    required this.userName,
    required this.password,
    required this.location,
  });
}
