import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/app/core/services/local_storage/i_local_storage_service.dart';

class HiveLocalStorageService implements ILocalStorageService {
  const HiveLocalStorageService();

  @override
  Future<void> load() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  @override
  Future<void> add(String key, Map<String, dynamic> data) async {
    final box = await Hive.openBox(key);
    final id = await box.add(data);

    await update(key, id, {'id': id, ...data});
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String key) async {
    final box = await Hive.openBox(key);
    final data = box.values;

    final handledData = List<Map>.from(data);
    return handledData.map(Map<String, dynamic>.from).toList();
  }

  @override
  Future<void> update(String key, int id, Map<String, dynamic> data) async {
    final box = await Hive.openBox(key);
    box.put(id, data);
  }
}
