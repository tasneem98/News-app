// If you don't append your API key correctly, or your API key is invalid, you will receive a 401 - Unauthorized HTTP error.

abstract class NewsException implements Exception {
  final String message;
  final int statusCode;

  NewsException({required this.statusCode, required this.message});

  @override
  String toString() => '$statusCode: $message';
}

// Api key invalid exception
class ApiKeyInvalidException extends NewsException {
  ApiKeyInvalidException() : super(statusCode: 401, message: 'Unauthorized');
}
