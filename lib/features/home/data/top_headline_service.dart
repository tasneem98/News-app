import 'package:dio/dio.dart';
import '/core/services/secure_storage_service.dart';
import '/features/home/data/model/top_heading_model.dart';

import '/core/network/api_exceptions.dart';
import '/core/network/dio_client.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<TopHeadingModel> getTopHeadline({
    required int page,
    String category = 'general',
    String country = 'us',
  }) async {
    final apiKey = await SecureStorageService().getDate(key: "api_key");

    try {
      final response = await dioClient.dio.get(
        '/top-headlines?apiKey=$apiKey&country=$country&category=$category&page=$page',
      );
      return TopHeadingModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExceptions(
        status: e.response!.statusCode.toString(),
        code: e.error.toString(),
        message: e.message.toString(),
      );
    }
  }

  Future<TopHeadingModel> searchEverything({
    required String keyword,
    String language = 'en',
  }) async {
    final apiKey = await SecureStorageService().getDate(key: "api_key");

    try {
      final response = await dioClient.dio.get(
        '/everything?q=$keyword&apiKey=$apiKey&language=$language',
      );
      return TopHeadingModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiExceptions(
        status: e.response!.statusCode.toString(),
        code: e.error.toString(),
        message: e.message.toString(),
      );
    }
  }
}
