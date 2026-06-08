abstract class IRemoteDataBaseServices {
  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  });

  Future<void> addWithId({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  });

  Future<void> update({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  });
  Future<void> updateSingleField({
    required String collection,
    required String id,
    required String fieldName,
    required dynamic newValue,
  });

  Future<void> delete({required String collection, required String id});
  Future<void> deleteSubCollection({
    required String collection,
    required String id,
    required String subCollection,
  });

  Future<Map<String, dynamic>> getById({
    required String collection,
    required String id,
  });

  Future<List<Map<String, dynamic>>> getAll({required String collection});
  Stream<List<Map<String, dynamic>>> getSubCollectionStream({
    required String collection,
    required String id,
    required String subCollection,
  });

  Stream<Map<String, dynamic>> streamById({
    required String collection,
    required String id,
  });

  Stream<List<Map<String, dynamic>>> getStreamCollection({
    required String collection,
  });

  Future<String> addToSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required Map<String, dynamic> data,
  });

  Future<void> addToSubCollectionWithId({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
    required Map<String, dynamic> data,
  });
  Future<void> updateSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
    required Map<String, dynamic> data,
  });

  Future<void> deleteFromSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
  });

  Future<List<Map<String, dynamic>>> getSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
  });

  Stream<List<Map<String, dynamic>>> streamSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
  });

  Future<List<Map<String, dynamic>>> where({
    required String collection,
    required String field,
    required dynamic value,
  });

  Future<List<Map<String, dynamic>>> whereSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String field,
    required dynamic value,
  });

  String? getUserId();

  Future<List<Map<String, dynamic>>> getAllWithPagination({
    required String collection,
    required int limit,
    required String? lastId,
  });

  Future<void> incrementField({
    required String collection,
    required String fieldKey,
    required num value,
  });

  Stream<List<Map<String, dynamic>>> getAllWithPaginationStream({
    required String collection,
    required int limit,
    required String? lastId,
  });
}
