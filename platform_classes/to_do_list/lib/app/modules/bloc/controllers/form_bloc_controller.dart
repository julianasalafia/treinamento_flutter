import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/add_task_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/date_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/tasks_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/states/add_task_bloc_state.dart';

import '../../../controllers/form_controller.dart';
import '../../../core/repositories/add_task_param.dart';
import '../../../core/services/overlay/i_overlay_service.dart';
import '../stores/add_task_bloc_store.dart';
import '../stores/date_bloc_store.dart';
import '../stores/tasks_bloc_store.dart';

class FormBlocController extends FormController {
  final AddTaskBlocStore addTaskBlocStore;
  final DateBlocStore _dateBlocStore;
  final TasksBlocStore _tasksBlocStore;
  final IOverlayService _overlayService;
  late final StreamSubscription _subscription;
  late DateTime _date;

  FormBlocController({
    required this.addTaskBlocStore,
    required TasksBlocStore tasksBlocStore,
    required DateBlocStore dateBlocStore,
    required IOverlayService overlayService,
  })  : _tasksBlocStore = tasksBlocStore,
        _dateBlocStore = dateBlocStore,
        _overlayService = overlayService {
    _subscription = addTaskBlocStore.stream.listen(_addTaskSubscription);
  }

  @override
  Future<void> save(AddTaskParam param) async {
    _date = param.initialDate;
    addTaskBlocStore.add(SaveTaskBlocEvent(param));
  }

  void _addTaskSubscription(AddTaskBlocState state) {
    if (state is LoadingAddTaskBlocState) {
      _overlayService.show();
    } else {
      _overlayService.hide();
    }
    if (addTaskBlocStore.isSuccess) {
      _dateBlocStore.add(ChangeDateBlocEvent(_date));
      _tasksBlocStore.add(GetTasksBlocEvent(_date));

      Modular.to.pop();
    }
  }

  void dispose() {
    _subscription.cancel();
  }
}
