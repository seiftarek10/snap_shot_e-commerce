abstract class ILocalDataBaseServices<T> {
  Future<void> addData({required T data});
  Future<void> addDataWithKey({required String key, required dynamic data});
  Future<void> clear();
  Future<void> delete({required String key});
  Future<List<T>> getAllData();
  Future<T> getData({required String key});
}
