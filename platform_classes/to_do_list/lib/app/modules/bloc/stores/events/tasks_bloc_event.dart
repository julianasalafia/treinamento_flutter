import 'package:to_do_list/app/core/models/task_model.dart';

class TasksBlocEvent {
  const TasksBlocEvent();
}

class DoneTaskBlocEvent extends TasksBlocEvent {
  const DoneTaskBlocEvent(this.task);
  final TaskModel task;
}

class ArchiveTaskBlocEvent extends TasksBlocEvent {
  const ArchiveTaskBlocEvent(this.task);
  final TaskModel task;
}

class GetTasksBlocEvent extends TasksBlocEvent {
  final DateTime date;
  const GetTasksBlocEvent(this.date);
}

class FilterTasksByDateBlocEvent extends TasksBlocEvent {
  final DateTime date;
  const FilterTasksByDateBlocEvent(this.date);
}

class FilterTasksByStatusBlocEvent extends TasksBlocEvent {
  final TaskStatus status;
  const FilterTasksByStatusBlocEvent(this.status);
}

class ClearFilterByStatusBlocEvent extends TasksBlocEvent {
  const ClearFilterByStatusBlocEvent();
}
