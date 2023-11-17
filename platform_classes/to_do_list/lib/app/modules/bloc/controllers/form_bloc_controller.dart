import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/modules/bloc/stores/date_bloc_event.dart';

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

  FormBlocController({
    required this.addTaskBlocStore,
    required TasksBlocStore tasksBlocStore,
    required DateBlocStore dateBlocStore,
    required IOverlayService overlayService,
  })  : _tasksBlocStore = tasksBlocStore,
        _dateBlocStore = dateBlocStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskBlocStore.add(param);

    if (addTaskBlocStore.isSuccess) {
      _dateBlocStore.add(ChangeDateBlocEvent(param.initialDate));
      unawaited(_tasksBlocStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
