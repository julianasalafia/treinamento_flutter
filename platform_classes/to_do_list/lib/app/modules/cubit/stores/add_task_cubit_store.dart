import 'package:bloc/bloc.dart';
import 'package:to_do_list/app/modules/cubit/stores/states/add_task_cubit_state.dart';

import '../../../core/repositories/add_task_param.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskCubitStore extends Cubit<AddTaskCubitState> {
  final TaskRepository repository;

  AddTaskCubitStore({required this.repository})
      : super(const InitialAddTaskCubitState());

  bool get isSuccess => state is SuccessAddTaskCubitState;

  Future<void> add(AddTaskParam param) async {
    emit(const LoadingAddTaskCubitState());

    Future.delayed(const Duration(seconds: 1));
    repository.addTask(param);

    emit(const SuccessAddTaskCubitState());
  }
}
