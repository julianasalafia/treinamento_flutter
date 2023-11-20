import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/form_controller.dart';
import '../../../core/repositories/add_task_param.dart';
import '../../../core/services/overlay/i_overlay_service.dart';
import '../stores/add_task_cubit_store.dart';
import '../stores/date_cubit_store.dart';
import '../stores/tasks_cubit_store.dart';

class FormCubitController extends FormController {
  final AddTaskCubitStore addTaskCubitStore;
  final DateCubitStore _dateCubitStore;
  final TasksCubitStore _tasksCubitStore;
  final IOverlayService _overlayService;

  FormCubitController({
    required this.addTaskCubitStore,
    required TasksCubitStore tasksCubitStore,
    required DateCubitStore dateCubitStore,
    required IOverlayService overlayService,
  })  : _tasksCubitStore = tasksCubitStore,
        _dateCubitStore = dateCubitStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskCubitStore.add(param);

    if (addTaskCubitStore.isSuccess) {
      _dateCubitStore.changeDate(param.initialDate);
      unawaited(_tasksCubitStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
