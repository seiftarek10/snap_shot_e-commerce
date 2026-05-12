abstract class IApiServices {
  Future<void> post({required Map<String, dynamic> data, required String url});
  Future<void> postWithId({
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
  Future<Map<String, dynamic>> getById({
    required String id,
    required String path,
  });
  Future<Map<String, dynamic>> getAll({required String path});
}
