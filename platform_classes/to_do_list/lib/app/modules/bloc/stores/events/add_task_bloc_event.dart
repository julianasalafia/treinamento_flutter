import 'package:to_do_list/app/core/repositories/add_task_param.dart';

class AddTaskBlocEvent {
  const AddTaskBlocEvent();
}

class SaveTaskBlocEvent extends AddTaskBlocEvent {
  final AddTaskParam param;
  const SaveTaskBlocEvent(this.param);
}
