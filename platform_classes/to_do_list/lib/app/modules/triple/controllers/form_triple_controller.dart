import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/form_controller.dart';
import '../../../core/repositories/add_task_param.dart';
import '../../../core/services/overlay/i_overlay_service.dart';
import '../stores/add_task_triple_store.dart';
import '../stores/date_triple_store.dart';
import '../stores/tasks_triple_store.dart';

class FormTripleController extends FormController {
  final AddTaskTripleStore addTaskTripleStore;
  final DateTripleStore _dateTripleStore;
  final TasksTripleStore _tasksTripleStore;
  final IOverlayService _overlayService;

  FormTripleController({
    required this.addTaskTripleStore,
    required TasksTripleStore tasksTripleStore,
    required DateTripleStore dateTripleStore,
    required IOverlayService overlayService,
  })  : _tasksTripleStore = tasksTripleStore,
        _dateTripleStore = dateTripleStore,
        _overlayService = overlayService;

  @override
  Future<void> save(AddTaskParam param) async {
    _overlayService.show();

    await addTaskTripleStore.add(param);

    if (addTaskTripleStore.isSuccess) {
      _dateTripleStore.changeDate(param.initialDate);
      unawaited(_tasksTripleStore.getTasks(param.initialDate));

      Modular.to.pop();
    }
    await _overlayService.hide();
  }
}
