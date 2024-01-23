import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import '../../../controllers/form_controller.dart';
import '../../../core/services/overlay/i_overlay_service.dart';
import '../stores/add_task_cn_store.dart';
import '../stores/date_cn_store.dart';
import '../stores/tasks_cn_store.dart';

class FormCnController extends FormController {
  final AddTaskCnStore addTaskCnStore;
  final DateCnStore _dateCnStore;
  final TasksCnStore _tasksCnStore;
  final IOverlayService _overlayService;

  FormCnController({
    required this.addTaskCnStore,
    required TasksCnStore tasksCnStore,
    required DateCnStore dateCnStore,
    required IOverlayService overlayService,
  })  : _tasksCnStore = tasksCnStore,
        _dateCnStore = dateCnStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskCnStore.add(param);

    if (addTaskCnStore.isSuccess) {
      _dateCnStore.changeDate(param.initialDate);
      unawaited(_tasksCnStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
