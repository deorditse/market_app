part of 'add_print_orders_bloc.dart';

@immutable
abstract class AddPrintOrdersState {}

class AddPrintOrdersInitial extends AddPrintOrdersState {}

class LoadingPrintOrdersState extends AddPrintOrdersState {}

class LoadedPrintOrdersState extends AddPrintOrdersState {}

class ErrorPrintOrdersState extends AddPrintOrdersState {
  final String messageError;

  ErrorPrintOrdersState({required this.messageError});
}
