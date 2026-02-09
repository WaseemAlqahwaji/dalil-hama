import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/auth/data/source/auth_local_source/auth_local_source.dart';
import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
import 'package:dalil_hama/injection.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    Map<String, String> headers;
    final login = await getIt<AuthLocalSource>().getToken();
    if (login != null) {
      headers = {'Authorization': 'Bearer $login'};
      options.headers.addAll(headers);
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        await getIt<AuthLocalSource>().getToken() != null) {
      getIt<AuthRepository>().logout();
    }
    super.onError(err, handler);
  }

  FormData copyFormData(FormData original) {
    FormData newFormData = FormData();

    for (var field in original.fields) {
      newFormData.fields.add(MapEntry(field.key, field.value));
    }

    for (var file in original.files) {
      newFormData.files.add(MapEntry(file.key, file.value.clone()));
    }

    return newFormData;
  }
}
