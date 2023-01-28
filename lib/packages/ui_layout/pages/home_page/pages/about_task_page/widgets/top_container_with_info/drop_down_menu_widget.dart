import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/container_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_button_style.dart';
import 'package:market_app/packages/ui_layout/style_app/text_style.dart';
import 'package:business_layout/business_layout.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/default_dialog.dart';
import 'package:models/models.dart';

class DropDownMenuWidget extends StatelessWidget {
  DropDownMenuWidget(
      {Key? key, this.isEditRooms = true, required this.location})
      : super(key: key);
  final bool isEditRooms;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final listRoomsBloc = BlocProvider.of<ListRoomsBloc>(context);

    return BlocBuilder<ListRoomsBloc, ListRoomsState>(
      buildWhen: (prev, next) => next.room != prev.room,
      builder: (context, state) {
        if (state.messageError != null) {
          BlocProvider.of<AuthBloc>(context).add(InitialAuthEvent());
        }
        return GestureDetector(
          onTap: (isEditRooms &&
                  state.listRooms.isNotEmpty &&
                  (state.messageError == null))
              ? () {
                  myDefaultDialog(
                    context: context,
                    message: "Выбор помещения",
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: state.listRooms.map(
                        (String val) {
                          return Card(
                            color: myColorIsActive.withOpacity(0.8),
                            child: myTextButton(
                              onPressed: () {
                                if (state.room != val) {
                                  listRoomsBloc
                                      .add(ChangeRoomsEvent(room: val));
                                  BlocProvider.of<AboutTaskBlocs>(context)
                                      .add(ResetAboutTasksInitialEvent());
                                }

                                Navigator.of(context).pop();
                              },
                              child: Text(
                                val,
                                style: myTextStyleFontS8Sans(
                                  context: context,
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                }
              : null,
          child: Container(
            decoration:
                myStyleContainer(context: context, borderRadius: 10).copyWith(
              border: Border.all(
                width: 2,
                color: theme.textTheme.bodyMedium!.color!,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1),
              child: Row(
                children: [
                  Text(
                    state.room != null ? state.room! : "загрузка",
                    style: myTextStyleFontS8Sans(context: context),
                  ),
                  if (isEditRooms)
                    const Icon(Icons.keyboard_arrow_right_rounded),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
