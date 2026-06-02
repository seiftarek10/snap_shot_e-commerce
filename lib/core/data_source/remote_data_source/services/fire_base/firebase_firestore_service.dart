import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';

class FirebaseFirestoreService extends IRemoteDataBaseServices {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  @override
  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    final result = await ref.collection(collection).add(data);
    return result.id;
  }

  @override
  Future<String> addToSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required Map<String, dynamic> data,
  }) async {
    final result = await ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .add(data);
    return result.id;
  }

  @override
  Future<void> addToSubCollectionWithId({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
    required Map<String, dynamic> data,
  }) async {
    await ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .set(data);
  }

  @override
  Future<void> addWithId({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await ref.collection(collection).doc(id).set(data);
  }

  @override
  Future<void> delete({required String collection, required String id}) async {
    await ref.collection(collection).doc(id).delete();
  }

  @override
  Future<void> deleteFromSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
  }) async {
    await ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .delete();
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({
    required String collection,
  }) async {
    final result = await ref.collection(collection).get();

    return result.docs.map((doc) {
      final data = doc.data();

      data['id'] = doc.id;

      return data;
    }).toList();
  }

  @override
  Future<Map<String, dynamic>> getById({
    required String collection,
    required String id,
  }) async {
    final result = await ref.collection(collection).doc(id).get();
    return result.data() ?? {};
  }

  @override
  Future<List<Map<String, dynamic>>> getSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
  }) async {
    final result = await ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .get();
    return result.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  @override
  Stream<List<Map<String, dynamic>>> getSubCollectionStream({
    required String collection,
    required String id,
    required String subCollection,
  }) {
    return FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .collection(subCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
  }

  @override
  Stream<Map<String, dynamic>> streamById({
    required String collection,
    required String id,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamCollection({
    required String collection,
  }) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Map<String, dynamic>>> streamSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> update({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await ref.collection(collection).doc(id).update(data);
  }

  @override
  Future<void> updateSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
    required Map<String, dynamic> data,
  }) async {
    await ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .update(data);
  }

  @override
  Future<List<Map<String, dynamic>>> where({
    required String collection,
    required String field,
    required value,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> whereSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String field,
    required value,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateSingleField({
    required String collection,
    required String id,
    required String fieldName,
    required newValue,
  }) async {
    await ref.collection(collection).doc(id).update({fieldName: newValue});
  }

  @override
  String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  @override
  Future<void> deleteSubCollection({
    required String collection,
    required String id,
    required String subCollection,
  }) async {
    final ordersRef = FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .collection(subCollection);

    final snapshot = await ordersRef.get();

    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllWithPagination({
    required String collection,
    required int limit,
    required String? lastId,
  }) async {
    Query query = ref.collection(collection).orderBy(FieldPath.documentId).limit(limit);

    if (lastId != null) {
      query = query.startAfter([lastId]);
    }

    final snapshot = await query.get();

  return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }
}
