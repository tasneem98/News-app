import 'package:dio/dio.dart';

import '../utils/constants.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppData.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  Dio get dio => _dio;
}
