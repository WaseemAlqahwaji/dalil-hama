import 'package:core_package/core_package.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
        headers: {'Accept': '*/*'},
        sendTimeout: Duration(seconds: 30),
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        validateStatus: (statusCode) {
          if (statusCode != null) {
            if (200 <= statusCode && statusCode < 300) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
      ),
    );
    dio.interceptors.addAll([
      // getIt<TokenInterceptor>(),
      DioCacheInterceptor(
        config: [
          DioCacheStoreConfig(
            endPoint: "/api/Sections",
            age: Duration(days: 1),
            behavior: DioCacheStoreBehavior.restoreAlways,
            matchStrategy: MatchingStrategy.pathToEnd,
          ),
          DioCacheStoreConfig(
            endPoint: "/api/schemas",
            age: Duration(days: 1),
            behavior: DioCacheStoreBehavior.restoreAlways,
            matchStrategy: MatchingStrategy.pathToEnd,
          ),
        ],
      ),
      UnifiInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        request: true,
        usePrint: true,
      ),
    ]);

    return dio;
  }

  @lazySingleton
  Logger get logger => Logger();
}
