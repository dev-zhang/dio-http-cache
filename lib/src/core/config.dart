import 'package:dio/dio.dart';
import 'package:dio_http_cache/src/store/store_impl.dart';

typedef Future<List<int>> Encrypt(List<int> str);
typedef Future<List<int>> Decrypt(List<int> str);

/// validate response status
/// response.statusCode
/// or response.data['status] ……
typedef ValidateResponse = bool Function(Response? response);

class CacheConfig {
  final Duration defaultMaxAge;
  final Duration? defaultMaxStale;
  final String? databasePath;
  final String databaseName;
  final String? baseUrl;
  final String defaultRequestMethod;

  final bool skipMemoryCache;
  final bool skipDiskCache;

  final int maxMemoryCacheCount;

  final Encrypt? encrypt;
  final Decrypt? decrypt;
  final ICacheStore? diskStore;

  final ValidateResponse? validateResponse;

  CacheConfig({
    this.defaultMaxAge = const Duration(days: 7),
    this.defaultMaxStale,
    this.defaultRequestMethod = "POST",
    this.databasePath,
    this.databaseName = "DioCache",
    this.baseUrl,
    this.skipDiskCache = false,
    this.skipMemoryCache = false,
    this.maxMemoryCacheCount = 100,
    this.encrypt,
    this.decrypt,
    this.diskStore,
    this.validateResponse,
  });
}
