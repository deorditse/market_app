import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/packages/ui_layout/style_app/consts_app.dart';
import 'package:market_app/packages/ui_layout/style_app/text_button_style.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/default_dialog.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/icon_and_message.dart';
import 'package:market_app/packages/ui_layout/widgets_for_all_pages/wrapper_sceleton_page.dart';
import 'package:business_layout/business_layout.dart';
import 'pages/about_task_page/about_task_page.dart';
import 'pages/about_task_page/pages/orders_to_fulfill_page/orders_to_fulfill_page.dart';
import 'widgets/card_with_task.dart';
import 'package:models/models.dart';

class HomePage extends StatefulWidget {
  static const String id = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SchedulerBinding.instance
        .addPostFrameCallback((_) => helloMessage(context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperSceletonPage(
      child: BlocProvider(
        create: (_) => ListTasksBloc()..add(GetListTasksEvent()),
        child: BlocBuilder<ListTasksBloc, ListTasksState>(
          builder: (context, state) {
            if (state is ListTasksLoadedState) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: state.listTasks.length,
                  itemBuilder: (context, index) {
                    return myTextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => AboutTaskPage(
                              title: state.listTasks[index],
                              location: getLocation(index: index),
                            ),
                          ),
                        );
                      },
                      child: CardWithTask(
                        text: state.listTasks[index],
                      ),
                    );
                  },
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Location getLocation({required int index}) {
    Location location = Location.v1;
    // switch (index) {
    //   case 0:
    //     location = Location.v1;
    //     break;
    //   case 1:
    //     location = Location.v2;
    //     break;
    //   case 2:
    //     location = Location.v3;
    //     break;

    //   case 3:
    //     location = Location.v4;
    //     break;
    // }
    return location;
  }
}

Future<void> helloMessage({required BuildContext context}) async {
  Future.delayed(Duration.zero);
  myDefaultDialog(
    context: context,
    icon: const Icon(
      Icons.check,
      color: Colors.green,
      size: 60,
    ),
    message: "Добро пожаловать!",
  );

  await Future.delayed(const Duration(seconds: 1)).then((value) =>
      Navigator.of(context).canPop() ? Navigator.of(context).pop() : null);
}
