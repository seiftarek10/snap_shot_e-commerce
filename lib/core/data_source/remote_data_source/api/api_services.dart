import 'package:snap_shot/core/data_source/remote_data_source/data_base_services_interfase.dart';

class ApiServices extends IRemoteDataBaseServices {
  @override
  Future<void> addData({required Map<String, dynamic> data, required String path}) {
    // TODO: implement addData
    throw UnimplementedError();
  }

  @override
  Future<void> addDataWithId({required Map<String, dynamic> data, required String path, required String id}) {
    // TODO: implement addDataWithId
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String id, required String path}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAll({required String path}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getItem({required String id, required String path}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> update({required Map<String, dynamic> data, required String id, required String path}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}