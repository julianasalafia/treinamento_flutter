import 'package:to_do_list/app/core/models/task_model.dart';
import 'package:to_do_list/app/core/repositories/add_task_param.dart';
import 'package:to_do_list/app/core/services/local_storage/i_local_storage_service.dart';

class TaskRepository {
  final ILocalStorageService _localStorageService;

  const TaskRepository(this._localStorageService);

  static const _key = 'tasks';

  Future<void> addTask(AddTaskParam param) async {
    final data = {
      'title': param.title,
      'description': param.description,
      'initialDate': param.initialDate.millisecondsSinceEpoch,
      'endDate': param.endDate.millisecondsSinceEpoch,
      'isDone': false,
      'status': TaskStatus.open.name,
    };
    await _localStorageService.add(_key, data);
  }

  Future<List<TaskModel>> getTasks() async {
    final data = await _localStorageService.getAll(_key);
    final tasks = data.map(TaskModel.fromMap).toList();

    return tasks;
  }

  Future<void> update(TaskModel task) async {
    await _localStorageService.update(_key, task.id, task.toMap());
  }
}
