import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snap_shot/core/services/data_base/data_base_services_interfase.dart';

class FirebaseFirestoreService extends IDataBaseServices {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    await ref.collection(path).doc().set(data);
  }

  @override
  Future<void> addDataWithId({
    required Map<String, dynamic> data,
    required String path,
    required String id,
  }) async {
    await ref.collection(path).doc(id).set(data);
  }

  @override
  Future<void> delete({required String id, required String path}) async {
    await ref.collection(path).doc(id).delete();
  }

  @override
  Future<Map<String, dynamic>> getAll({required String path}) async {
    final snapshot = await ref.collection(path).get();
    final data = <String, dynamic>{};
    for (var doc in snapshot.docs) {
      data[doc.id] = doc.data();
    }
    return data;
  }

  @override
  Future<Map<String, dynamic>> getItem({
    required String id,
    required String path,
  }) async {
    final snapShot = await ref.collection(path).doc(id).get();
    return snapShot.data() ?? {};
  }

  @override
  Future<void> update({
    required Map<String, dynamic> data,
    required String id,
    required String path,
  }) async {
    await ref.collection(path).doc(id).update(data);
  }
}
