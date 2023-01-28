import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:market_app/packages/ui_layout/pages/home_page/pages/about_task_page/pages/orders_to_fulfill_page/pages/qr_code_scanner_page.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/default_dialog.dart';
import 'package:models/models.dart';
import 'drop_down_menu_widget.dart';

class TopContainerWithInfo extends StatelessWidget {
  const TopContainerWithInfo({
    Key? key,
    this.isReport = false,
    this.isEditRooms = true,
    required this.title,
    required this.location,
  }) : super(key: key);
  final bool isReport;
  final bool isEditRooms;
  final String title;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: myStyleContainer(context: context),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          if (isReport)
                            BlocBuilder<AddPrintOrdersBloc,
                                AddPrintOrdersState>(
                              builder: (context, state) {
                                if (state is ErrorPrintOrdersState) {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback(
                                    (_) async => await myDefaultDialog(
                                      icon: const Icon(
                                        Icons.print_disabled,
                                        size: 50,
                                      ),
                                      context: context,
                                      message: state.messageError,
                                    ),
                                  );
                                }
                                return GestureDetector(
                                  onTap: () {
                                    print('todo print');
                                    BlocProvider.of<AddPrintOrdersBloc>(context)
                                        .add(
                                      AddNewPrintOrdersEvent(
                                        listIdOrders: BlocProvider.of<
                                                OrdersToFulfillBloc>(context)
                                            .state
                                            .listWithIdOrdersCheckOrdersToFulfill,
                                        userName:
                                            BlocProvider.of<AuthBloc>(context)
                                                .state
                                                .userName!,
                                        password:
                                            BlocProvider.of<AuthBloc>(context)
                                                .state
                                                .password!,
                                        location: location,
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: (state is LoadingPrintOrdersState)
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.black,
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                              Text(
                                                "Печать...",
                                                style: myTextStyleFontS8Sans(
                                                  context: context,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const Icon(
                                            Icons.print,
                                            size: 35,
                                          ),
                                  ),
                                );
                              },
                            )
                          else
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(Icons.arrow_back)),
                          Center(
                            child: Text(
                              title,
                              style: myTextStyleFontS8Sans(context: context),
                            ),
                          ),
                          if (isReport)
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  print('todo add photo');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return BlocProvider<
                                            OrdersToFulfillBloc>.value(
                                          value: BlocProvider.of<
                                              OrdersToFulfillBloc>(context),
                                          child: QrCodeScannerPage(),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.camera_alt,
                                      size: 30,
                                    ),
                                    BlocBuilder<OrdersToFulfillBloc,
                                        OrdersToFulfillState>(
                                      builder: (context, state) {
                                        return Text(
                                          state.barcodeText != null
                                              ? "Место: ${state.barcodeText!}"
                                              : "no scan",
                                          style: myTextStyleFontS8Sans(
                                              context: context, fontSize: 10),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        "${BlocProvider.of<AuthBloc>(context).state.userName!} Дата (${DateFormat('dd.MM.yyyy').format(DateTime.now())})",
                        //${BlocProvider.of<AuthBloc>(context).state.userName!}
                        style: myTextStyleFontS8Sans(
                          context: context,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDownMenuWidget(
                  isEditRooms: isEditRooms,
                  location: location,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  // buildWhen: (prev, next) => next.balance != prev.balance,
                  builder: (context, state) {
                    print("AuthBloc ${state.balance}");
                    return Text(
                      "${state.balance} руб",
                      style: myTextStyleFontS8Sans(
                        context: context,
                        textColor: Colors.red,
                        fontSize: 22,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
