part of 'add_print_orders_bloc.dart';

@immutable
class AddNewPrintOrdersEvent {
  final Set<String> listIdOrders;
  final String userName;
  final String password;
  final Location location;

  AddNewPrintOrdersEvent({
    required this.listIdOrders,
    required this.userName,
    required this.password,
    required this.location,
  });
}

class InitialPrintOrdersEvent extends AddNewPrintOrdersEvent {
  InitialPrintOrdersEvent({
    required super.listIdOrders,
    required super.userName,
    required super.password,
    required super.location,
  });
}
