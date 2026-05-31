import 'package:snap_shot/core/data_source/remote_data_source/api/api_interface.dart';
import 'package:dio/dio.dart';

class DioServices extends IApiServices {
  final Dio _dio;
  final String _baseUrl = 'https://dummyjson.com/';
  DioServices(this._dio);
  @override
  Future<void> post({
    required Map<String, dynamic> data,
    required String url,
  }) async {
    await _dio.post('$_baseUrl/$url', data: data);
  }

  @override
  Future<void> postWithId({
    required Map<String, dynamic> data,
    required String path,
    required String id,
  }) async {
    await _dio.post('$_baseUrl/$path/$id', data: data);
  }

  @override
  Future<void> delete({required String id, required String path}) async {
    await _dio.delete('$_baseUrl/$path/$id');
  }

  @override
  Future<Map<String, dynamic>> getAll({required String path}) async {
    final response = await _dio.get('$_baseUrl/$path');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> getById({
    required String id,
    required String path,
  }) async {
    final response = await _dio.get('$_baseUrl/$path/$id');
    return response.data;
  }

  @override
  Future<void> update({
    required Map<String, dynamic> data,
    required String id,
    required String path,
  }) async {
    await _dio.put('$_baseUrl/$path/$id', data: data);
  }
}
