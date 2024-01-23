import 'package:bloc/bloc.dart';
import 'package:to_do_list/app/modules/bloc/stores/events/add_task_bloc_event.dart';
import 'package:to_do_list/app/modules/bloc/stores/states/add_task_bloc_state.dart';
import '../../../core/repositories/task_repository.dart';

class AddTaskBlocStore extends Bloc<AddTaskBlocEvent, AddTaskBlocState> {
  final TaskRepository repository;

  AddTaskBlocStore({required this.repository})
      : super(const InitialAddTaskBlocState()) {
    on<SaveTaskBlocEvent>(_save);
  }

  bool get isSuccess => state is SuccessAddTaskBlocState;

  Future<void> _save(
      SaveTaskBlocEvent event, Emitter<AddTaskBlocState> emitter) async {
    emitter(const LoadingAddTaskBlocState());

    Future.delayed(const Duration(seconds: 1));
    await repository.addTask(event.param);

    emitter(const SuccessAddTaskBlocState());
  }
}
