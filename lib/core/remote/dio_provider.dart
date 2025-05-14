import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

String kIsTokenRequired = 'isTokenRequired';
String kAuthorization = 'Authorization';
final kBearer = 'Bearer';
final kRetryCount = 'RetryCount';

@Riverpod(dependencies: [])
Dio dio(Ref ref) {
  // Basic Dio instance. Configuration can be added here as needed.
  // For example, base URL, interceptors, etc.
  final options = BaseOptions(
    baseUrl: 'https://api.github.com',
    responseType: ResponseType.json,
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    sendTimeout: const Duration(minutes: 1),
    headers: {
      "contentType": Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      kIsTokenRequired: true,
    },
  );
  final dio = Dio(options);

  // Example: Add an interceptor for logging or error handling
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
