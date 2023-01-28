part of 'orders_to_fulfill_bloc.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@unfreezed
class OrdersToFulfillState with _$OrdersToFulfillState {
  factory OrdersToFulfillState({
    @Default([]) List<InfoOrderModel> listOrdersToFulfill,
    @Default([]) Set<String> listWithIdOrdersCheckOrdersToFulfill,
    @Default(false) bool isCheckAll,
    @Default(true) bool isLoading,
    @Default(false) bool isSendingOnServer,
    @Default("0.0") String balance,
    String? barcodeText,
    String? messageError,
  }) = _OrdersToFulfillState;
}
