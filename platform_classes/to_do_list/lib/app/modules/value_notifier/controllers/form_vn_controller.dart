import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/add_task_param.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/add_task_vn_store.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/date_vn_store.dart';
import 'package:to_do_list/app/modules/value_notifier/stores/tasks_vn_store.dart';

import '../../../controllers/form_controller.dart';
import '../../../core/services/i_overlay_service.dart';

class FormVnController extends FormController {
  final AddTaskVnStore addTaskVnStore;
  final DateVnStore _dateVnStore;
  final TasksVnStore _tasksVnStore;
  final IOverlayService _overlayService;

  FormVnController({
    required this.addTaskVnStore,
    required TasksVnStore tasksVnStore,
    required DateVnStore dateVnStore,
    required IOverlayService overlayService,
  })  : _tasksVnStore = tasksVnStore,
        _dateVnStore = dateVnStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskVnStore.add(param);

    if (addTaskVnStore.isSuccess) {
      _dateVnStore.changeDate(param.initialDate);
      unawaited(_tasksVnStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
