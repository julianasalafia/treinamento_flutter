abstract interface class ILocalStorageService {
  Future<void> add(String key, Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> getAll(String key);
  Future<void> update(String key, int id, Map<String, dynamic> data);
}
