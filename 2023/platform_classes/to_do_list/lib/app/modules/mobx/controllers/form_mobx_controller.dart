import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import '../../../controllers/form_controller.dart';
import '../../../core/services/overlay/i_overlay_service.dart';
import '../stores/add_task_mobx_store.dart';
import '../stores/date_mobx_store.dart';
import '../stores/tasks_mobx_store.dart';

class FormMobxController extends FormController {
  final AddTaskMobxStore addTaskMobxStore;
  final DateMobxStore _dateMobxStore;
  final TasksMobxStore _tasksMobxStore;
  final IOverlayService _overlayService;

  FormMobxController({
    required this.addTaskMobxStore,
    required TasksMobxStore tasksMobxStore,
    required DateMobxStore dateMobxStore,
    required IOverlayService overlayService,
  })  : _tasksMobxStore = tasksMobxStore,
        _dateMobxStore = dateMobxStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskMobxStore.add(param);

    if (addTaskMobxStore.isSuccess) {
      _dateMobxStore.changeDate(param.initialDate);
      unawaited(_tasksMobxStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
