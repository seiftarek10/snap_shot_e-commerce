abstract class IDataBaseServices {
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
  });
  Future<void>addDataWithId({
    required Map<String, dynamic> data,
    required String path,
    required String id,
  });
  Future<void> delete({required String id, required String path});
  Future<void> update({
    required Map<String, dynamic> data,
    required String id,
    required String path,
  });
  Future<Map<String, dynamic>> getItem({
    required String id,
    required String path,
  });
  Future<Map<String, dynamic>> getAll({required String path});
}
