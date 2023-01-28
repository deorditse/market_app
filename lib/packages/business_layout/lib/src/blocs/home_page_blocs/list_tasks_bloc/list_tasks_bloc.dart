import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_tasks_event.dart';

part 'list_tasks_state.dart';

class ListTasksBloc extends Bloc<ListTasksEvent, ListTasksState> {
  ListTasksBloc() : super(ListTasksInitialState()) {
    on<GetListTasksEvent>(_getListTasks);
  }

  Future<void> _getListTasks(
      GetListTasksEvent event, Emitter<ListTasksState> emit) async {
    ///заготовка на будущее если этот список буду получать из базы
    emit(ListTasksLoadedState(listTasks: [
      "ЗАКАЗЫ НА СБОРКУ WILDBERRIS",
      "ЗАКАЗЫ НА РАСКЛАДКУ",
      "ЗАКАЗЫ НА УПАКОВКУ",
      "ЗАКАЗЫ НА ПРОИЗВОДСТВЕ",
    ]));
  }
}
