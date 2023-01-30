import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/data_layout/lib/data_layout.dart';
import 'package:market_app/packages/ui_layout/pages/home_page/pages/about_task_page/pages/orders_to_fulfill_page/pages/qr_code_scanner_page.dart';
import 'package:market_app/packages/ui_layout/pages/home_page/pages/about_task_page/widgets/top_container_with_info/top_container_with_info.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/style_buttons.dart';
import 'package:market_app/packages/ui_layout/style_app/text_button_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/default_dialog.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/icon_and_message.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/wrapper_sceleton_page.dart';
import 'package:business_layout/business_layout.dart';
import 'widgets/card_order_to_fulfill.dart.dart';
import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class OrdersToFulfillPage extends StatefulWidget {
  static const String id = '/ordersToFulfillPage';

  const OrdersToFulfillPage({
    Key? key,
    required this.title,
    required this.location,
    required this.listWithOrders,
  }) : super(key: key);
  final String title;
  final List<InfoOrderModel> listWithOrders;
  final Location location;

  @override
  State<OrdersToFulfillPage> createState() => _OrdersToFulfillPageState();
}

class _OrdersToFulfillPageState extends State<OrdersToFulfillPage> {
  late OrdersToFulfillBloc ordersToFulfillBloc;

  @override
  void initState() {
    super.initState();
    ordersToFulfillBloc = OrdersToFulfillBloc()
      ..add(SetListOrdersToFulfillEvent(listWithOrders: widget.listWithOrders));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrdersToFulfillBloc>(
      create: (_) => ordersToFulfillBloc,
      child: WrapperSceletonPage(
        child: Column(
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider<AddPrintOrdersBloc>(
                  create: (context) => AddPrintOrdersBloc(),
                ),
                BlocProvider.value(
                  value: ordersToFulfillBloc,
                ),
              ],
              child: TopContainerWithInfo(
                isEditRooms: false,
                isReport: true,
                title: widget.title,
                location: widget.location,
              ),
            ),
            mySizedHeightBetweenContainer,
            Expanded(
              child: BlocBuilder<OrdersToFulfillBloc, OrdersToFulfillState>(
                bloc: ordersToFulfillBloc,
                builder: (context, state) {
                  if (state.messageError != null) {
                    SchedulerBinding.instance.addPostFrameCallback(
                      (_) async => await myDefaultDialog(
                        icon: const Icon(
                          Icons.error_outline,
                          size: 50,
                        ),
                        context: context,
                        message: state.messageError!,
                      ),
                    );
                  }

                  if (state.isLoading) {
                    return const IconAndMessage(message: "Секундочку...");
                  } else if (state.listOrdersToFulfill.isNotEmpty) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (state.isCheckAll) {
                              ordersToFulfillBloc
                                  .add(AddCheckAllOrders(isCheckAll: false));
                            } else {
                              ordersToFulfillBloc
                                  .add(AddCheckAllOrders(isCheckAll: true));
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                state.isCheckAll
                                    ? Icons.check_circle_outline
                                    : Icons.radio_button_unchecked,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Выбрать все',
                                style: myTextStyleFontS8Sans(
                                    context: context, fontSize: 16),
                              ),
                              Expanded(child: Container()),
                              if (state.listWithIdOrdersCheckOrdersToFulfill
                                  .isNotEmpty)
                                Text(
                                  'Выбрано: ${state.listWithIdOrdersCheckOrdersToFulfill.length}',
                                  style: myTextStyleFontS8Sans(
                                      context: context, fontSize: 16),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            // primary: false,
                            itemCount: widget.listWithOrders.length,
                            itemBuilder: (context, index) {
                              Set<String> listCheckOrders =
                                  state.listWithIdOrdersCheckOrdersToFulfill;

                              String idOrder =
                                  widget.listWithOrders[index].id_order!;
                              return myTextButton(
                                onPressed: () {
                                  if (listCheckOrders.contains(idOrder)) {
                                    ordersToFulfillBloc.add(
                                      AddCheckAllOrders(
                                        isCheckAll: false,
                                      ),
                                    );
                                    listCheckOrders.remove(idOrder);
                                    ordersToFulfillBloc.add(
                                      AddCheckOrders(
                                        listWithIdOrdersCheckOrdersToFulfill:
                                            listCheckOrders,
                                      ),
                                    );
                                  } else {
                                    if (listCheckOrders.length ==
                                        widget.listWithOrders.length - 1) {
                                      ordersToFulfillBloc.add(
                                        AddCheckAllOrders(
                                          isCheckAll: true,
                                        ),
                                      );
                                    } else {
                                      ordersToFulfillBloc.add(
                                        AddCheckOrders(
                                          listWithIdOrdersCheckOrdersToFulfill: {
                                            ...listCheckOrders,
                                            idOrder,
                                          },
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: CardOrderToFulfill(
                                  infoOrder: widget.listWithOrders[index],
                                  isCheck: listCheckOrders.contains(idOrder),
                                  location: widget.location,
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BlocListener<OrdersToFulfillBloc,
                                  OrdersToFulfillState>(
                                listenWhen: (prev, next) =>
                                    next.balance != prev.balance,
                                listener: (context, state) {
                                  print(state.listOrdersToFulfill.length);
                                  BlocProvider.of<AboutTaskBlocs>(context).add(
                                    GetListAboutTasksEvent(
                                      location: widget.location,
                                      userName: context
                                          .read<AuthBloc>()
                                          .state
                                          .userName!,
                                      password: context
                                          .read<AuthBloc>()
                                          .state
                                          .password!,
                                      room: BlocProvider.of<ListRoomsBloc>(
                                              context)
                                          .state
                                          .room!,
                                    ),
                                  );
                                },
                                child: MyButton(
                                  customBackgroundColor: Colors.white,
                                  child: Text(
                                    'НАЗАД',
                                    style: myTextStyleFontS8Sans(
                                        context: context, fontSize: 16),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                              BlocConsumer<OrdersToFulfillBloc,
                                  OrdersToFulfillState>(
                                listenWhen: (prev, next) =>
                                    prev.balance != next.balance,
                                listener: (context, state) {
                                  BlocProvider.of<AuthBloc>(context)
                                      .add(AddBalanceAuthEvent(
                                    newBalance: state.balance,
                                  ));
                                },
                                // buildWhen: (prev, next) =>
                                //     next.listOrdersToFulfill !=
                                //     prev.listOrdersToFulfill,
                                builder: (context, state) {
                                  return MyButton(
                                    customBackgroundColor: Colors.white,
                                    child: state.isSendingOnServer
                                        ? const CircularProgressIndicator(
                                            color: myColorIsActive,
                                          )
                                        : Text(
                                            'ВЫПОЛНЕНО',
                                            style: myTextStyleFontS8Sans(
                                                context: context, fontSize: 16),
                                          ),
                                    onTap: () {
                                      if (ordersToFulfillBloc
                                              .state.barcodeText ==
                                          null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) {
                                              return BlocProvider<
                                                  OrdersToFulfillBloc>.value(
                                                value: ordersToFulfillBloc,
                                                child: QrCodeScannerPage(),
                                              );
                                            },
                                          ),
                                        ).then(
                                          (_) {
                                            if (ordersToFulfillBloc
                                                    .state.barcodeText !=
                                                null) {
                                              conditionCheck();
                                            }
                                          },
                                        );
                                      } else {
                                        conditionCheck();
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                            child: Text(
                              'Тут все выполнено!\n\n<- Вернуться к заказам',
                              style: myTextStyleFontS8Sans(
                                context: context,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> conditionCheck() async {
    if (ordersToFulfillBloc
        .state.listWithIdOrdersCheckOrdersToFulfill.isNotEmpty) {
      if (ordersToFulfillBloc.state.barcodeText ==
          widget.listWithOrders.first.place) {
        ordersToFulfillBloc.add(
          SendCompletedOrdersToTheServer(
            listCompletedOrders: ordersToFulfillBloc
                .state.listWithIdOrdersCheckOrdersToFulfill
                .toList(),
            location: widget.location,
            userName: context.read<AuthBloc>().state.userName!,
            password: context.read<AuthBloc>().state.password!,
          ),
        );
      } else {
        myDefaultDialog(
          context: context,
          message:
              "Неправильная локация: ${ordersToFulfillBloc.state.barcodeText}\nДолжна быть: ${widget.listWithOrders.first.place}",
          icon: const Icon(
            Icons.location_off_outlined,
            size: 40,
          ),
        );
      }
    } else {
      myDefaultDialog(
        context: context,
        message: "Выберите позиции",
        icon: const Icon(
          Icons.sd_card_alert_outlined,
          size: 40,
        ),
      );
    }
  }
}
