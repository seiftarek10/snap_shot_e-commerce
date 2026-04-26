import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/local_data_base_interface.dart';

class HiveServices<T> extends ILocalDataBase {
  final String boxName;

  HiveServices(this.boxName);
  @override
  Future<void> addData({required data}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.addAll(data);
  }

  @override
  Future<void> delete({required String key}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  @override
  Future<dynamic> getData({required String key}) async {
    Box<T> box = Hive.box<T>(boxName);
    if (box.containsKey(key)) {
      return box.get(key);
    }
    return null;
  }

  @override
  Future<void> addDataWithKey({required String key, required data}) async {
    Box<T> box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  @override
  Future<void> clear() async {
    Box<T> box = Hive.box<T>(boxName);
    await box.clear();
  }

  @override
  Future<dynamic> getAllData() async {
    Box<T> box = Hive.box<T>(boxName);
    return box.values.toList();
  }
}
