import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> setDate({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?>? getDate({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteDate({required String key}) async {
    await _storage.delete(key: key);
  }
}
