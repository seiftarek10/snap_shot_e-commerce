import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap_shot/core/data_source/remote_data_source/services/service_interface.dart';

class FirebaseFirestoreService extends IRemoteDataBaseServices {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  
  // Centralized Timeout Threshold (5 Seconds)
  static const Duration _timeoutDuration = Duration(seconds: 7);

  // Helper method to wrap any Firestore Future safely with a timeout
  Future<T> _guard<T>(Future<T> Function() operation) {
    return operation().timeout(
      _timeoutDuration,
      onTimeout: () => throw TimeoutException(
        'Please check your internet connection.',
      ),
    );
  }

  @override
  Future<String> add({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    final result = await _guard(() => ref.collection(collection).add(data));
    return result.id;
  }

  @override
  Future<String> addToSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required Map<String, dynamic> data,
  }) async {
    final result = await _guard(() => ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .add(data));
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
    await _guard(() => ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .set(data));
  }

  @override
  Future<void> addWithId({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await _guard(() => ref.collection(collection).doc(id).set(data));
  }

  @override
  Future<void> delete({required String collection, required String id}) async {
    await _guard(() => ref.collection(collection).doc(id).delete());
  }

  @override
  Future<void> deleteFromSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
  }) async {
    await _guard(() => ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .delete());
  }

  @override
  Future<List<Map<String, dynamic>>> getAll({
    required String collection,
  }) async {
    final result = await _guard(() => ref.collection(collection).get());

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
    final result = await _guard(() => ref.collection(collection).doc(id).get());
    return result.data() ?? {};
  }

  @override
  Future<List<Map<String, dynamic>>> getSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
  }) async {
    final result = await _guard(() => ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .get());
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
    return ref
        .collection(collection)
        .doc(id)
        .collection(subCollection)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());
  }

  @override
  Stream<List<Map<String, dynamic>>> getStreamCollection({
    required String collection,
  }) {
    return ref.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Future<void> update({
    required String collection,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await _guard(() => ref.collection(collection).doc(id).update(data));
  }

  @override
  Future<void> updateSubCollection({
    required String collection,
    required String parentId,
    required String subCollection,
    required String childId,
    required Map<String, dynamic> data,
  }) async {
    await _guard(() => ref
        .collection(collection)
        .doc(parentId)
        .collection(subCollection)
        .doc(childId)
        .update(data));
  }

  @override
  Future<void> updateSingleField({
    required String collection,
    required String id,
    required String fieldName,
    required newValue,
  }) async {
    await _guard(() => ref.collection(collection).doc(id).update({fieldName: newValue}));
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

    final snapshot = await _guard(() => ordersRef.get());

    for (final doc in snapshot.docs) {
      await _guard(() => doc.reference.delete());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllWithPagination({
    required String collection,
    required int limit,
    required String? lastId,
  }) async {
    Query query = ref
        .collection(collection)
        .orderBy(FieldPath.documentId)
        .limit(limit);

    if (lastId != null) {
      query = query.startAfter([lastId]);
    }

    final snapshot = await _guard(() => query.get());

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  @override
  Future<void> incrementField({
    required String collection,
    required String fieldKey,
    required num value,
  }) async {
    await _guard(() => ref.collection(collection).doc('1').update({
      fieldKey: FieldValue.increment(value),
    }));
  }

  @override
  Stream<List<Map<String, dynamic>>> getAllWithPaginationStream({
    required String collection,
    String? lastId,
    required int limit,
  }) async* {
    DocumentSnapshot? lastDocument;

    if (lastId != null) {
      lastDocument = await _guard(() => ref.collection(collection).doc(lastId).get());
    }

    Query query = ref
        .collection(collection)
        .orderBy(FieldPath.documentId)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    yield* query.snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Stream<List<Map<String, dynamic>>> getStreamCollectionGroup({
    required String subCollectionId,
  }) {
    return ref.collectionGroup(subCollectionId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  @override
  Future<void> moveDocumentBetweenSubCollections({
    required String fromCollection,
    required String toCollection,
    required String parentId,
    required String fromsubCollection,
    required String tosubCollection,
    required String childId,
    required Map<String, dynamic> data,
  }) async {
    final batch = ref.batch();

    final fromRef = ref
        .collection(fromCollection)
        .doc(parentId)
        .collection(fromsubCollection)
        .doc(childId);

    final toRef = ref
        .collection(toCollection)
        .doc(parentId)
        .collection(tosubCollection)
        .doc(childId);

    batch.set(toRef, data);
    batch.delete(fromRef);

    await _guard(() => batch.commit());
  }
}