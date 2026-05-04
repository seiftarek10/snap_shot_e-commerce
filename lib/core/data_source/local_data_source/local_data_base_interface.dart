abstract class ILocalDataBaseServices<T> {
  Future<void> addDataObject({required T data});
  Future<void> addAllData({required List<T> data});
  Future<void> addDataWithKey({required String key, required dynamic data});
  Future<void> clear();
  Future<void> delete({required String key});
  List<T>? getAllData();
  Future<T?> getData({required String key});
}
