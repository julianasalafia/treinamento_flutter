import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/modules/mobx/stores/states/add_task_mobx_state.dart';
import '../../../core/repositories/task_repository.dart';
import 'package:mobx/mobx.dart';
part 'add_task_mobx_store.g.dart';

// ignore: library_private_types_in_public_api
class AddTaskMobxStore = _AddTaskMobxStore with _$AddTaskMobxStore;

abstract class _AddTaskMobxStore with Store {
  final TaskRepository repository;

  _AddTaskMobxStore({required this.repository}) : _state = const InitialAddTaskMobxState();

  bool get isSuccess => _state is SuccessAddTaskMobxState;

  @readonly
  AddTaskMobxState _state;

  @action
  Future<void> add(AddTaskParam param) async {
    _state = const LoadingAddTaskMobxState();

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    _state = const SuccessAddTaskMobxState();
  }
}
