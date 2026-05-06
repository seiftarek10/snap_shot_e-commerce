import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';

class HiveServices<T> extends ILocalDataBaseServices<T> {
  final String boxName;

  HiveServices(this.boxName);
  @override
  Future<void> addDataObject({required data}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.addAll(data as Iterable<T>);
  }

  @override
  Future<void> delete({required String key}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  @override
  Future<T?> getData({required String key}) async {
    Box<T> box = Hive.box<T>(boxName);
    if (box.containsKey(key)) {
      return box.get(key) as T;
    }
    return null;
  }

  @override
  Future<void> clear() async {
    Box<T> box = Hive.box<T>(boxName);
    await box.clear();
  }

  @override
  List<T> getAllData() {
    Box<T> box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> addDataWithKey({
    required String key,
    required dynamic data,
  }) async {
    Box<T> box = Hive.box<T>(boxName);
    if (box.containsKey(key)) {
      await box.delete(key);
    }
    await box.put(key, data);
  }

  @override
  Future<void> addAllData({required List<T> data}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.addAll(data);
  }
}
