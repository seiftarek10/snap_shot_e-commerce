abstract class ILocalDataBase {
  Future<void> addData({required dynamic data});
  Future<void> addDataWithKey({required String key, required dynamic data});
  Future<void> clear();
  Future<void> delete({required String key});
  Future<dynamic> getAllData();
  Future<dynamic> getData({required String key});
}
