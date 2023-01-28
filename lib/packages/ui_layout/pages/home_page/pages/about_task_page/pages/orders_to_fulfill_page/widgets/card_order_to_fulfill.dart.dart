import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:models/models.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/container_for_photo.dart';
import 'package:business_layout/business_layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:market_app/packages/data_layout/lib/data_layout.dart';

import 'package:http/http.dart' as http;
import 'package:models/models.dart';

class CardOrderToFulfill extends StatelessWidget {
  const CardOrderToFulfill(
      {Key? key,
      required this.infoOrder,
      required this.isCheck,
      required this.location})
      : super(key: key);
  final InfoOrderModel infoOrder;
  final bool isCheck;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        // A pane can dismiss the Slidable.

        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(15), left: Radius.circular(5)),
            onPressed: (_) async {
              final providerAuth = BlocProvider.of<AuthBloc>(context).state;

              context.read<OrdersToFulfillBloc>().add(
                    AddProblemOrdersToFulfillEvent(
                      problemOrder: infoOrder,
                      userName: providerAuth.userName!,
                      password: providerAuth.password!,
                      location: location,
                    ),
                  );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.record_voice_over,
            label: 'Проблемный',
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            isCheck ? Icons.check_circle_outline : Icons.radio_button_unchecked,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              height: 80,
              width: double.infinity,
              decoration: myStyleContainer(context: context).copyWith(
                color: isCheck
                    ? myColorIsActive.withOpacity(0.4)
                    : Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: theme.textTheme.titleLarge!.color!,
                ),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: ContainerForPhotoFuture(
                      borderRadius: 10,
                      imagePathFromNetwork: infoOrder.foto,
                      isOpenView: true,
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            infoOrder.place,
                                            overflow: TextOverflow.ellipsis,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            '(Ячейка)',
                                            overflow: TextOverflow.ellipsis,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 7,
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Text(
                                            infoOrder.name,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 10,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            '1 шт',
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              newFontWeight: FontWeight.w300,
                                              fontSize: 25,
                                            ),
                                          ),
                                          Text(
                                            'Номенклатуры',
                                            overflow: TextOverflow.ellipsis,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 4),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${infoOrder.marking_PartA} ${infoOrder.marking_PartB}',
                                    overflow: TextOverflow.ellipsis,
                                    style: myTextStyleFontS8Sans(
                                      context: context,
                                    ),
                                  ),
                                  Text(
                                    '(Маркировка)',
                                    overflow: TextOverflow.ellipsis,
                                    style: myTextStyleFontS8Sans(
                                      context: context,
                                      fontSize: 7,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              '${infoOrder.package}',
                                              style: myTextStyleFontS8Sans(
                                                context: context,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '(Пакет)',
                                            overflow: TextOverflow.ellipsis,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (infoOrder.dop != null)
                                            Text(
                                              infoOrder.dop!,
                                              style: myTextStyleFontS8Sans(
                                                context: context,
                                                fontSize: 14,
                                              ),
                                            ),
                                          Text(
                                            'Доп сведения',
                                            overflow: TextOverflow.ellipsis,
                                            style: myTextStyleFontS8Sans(
                                              context: context,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//отметить проблемный заказ
Future<Map<int, dynamic>?> addProblemOrder({
  required Location location,
  required String userName,
  required String password,
  required InfoOrderModel problemOrder,
}) async {
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('$userName:$password'))}';

  var post = http.post(
    urlMain(urlPath: '${location.name}/problem/GetInfo'),
    body: json.encode({
      "name": userName,
      "Nomenclature": problemOrder.name,
      "id_order": problemOrder.id_order,
      "marking_PartA": problemOrder.marking_PartA,
      "marking_PartB": problemOrder.marking_PartB,
    }),
    headers: {
      'Authorization': basicAuth,
    },
  );
  var response = post;
  return await genericRequestHttp<String>(
    nameMethod: 'addProblemOrder',
    setResponse: response,
  );
}
