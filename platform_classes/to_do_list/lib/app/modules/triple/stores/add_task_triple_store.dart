import 'package:flutter_triple/flutter_triple.dart';
import 'package:to_do_list/app/modules/triple/stores/states/add_task_triple_state.dart';

import '../../../core/repositories/add_task_param.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskTripleStore extends Store<AddTaskTripleState> {
  final TaskRepository repository;

  AddTaskTripleStore({required this.repository}) : super(const InitialAddTaskTripleState());

  bool get isSuccess => state is SuccessAddTaskTripleState;

  Future<void> add(AddTaskParam param) async {
    setLoading(true);

    Future.delayed(const Duration(seconds: 1));

    repository.addTask(param);

    update(const SuccessAddTaskTripleState());
  }
}
