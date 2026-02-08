// import 'package:core_package/core_package.dart';
// import 'package:dalil_hama/features/auth/data/source/auth_local_source/auth_local_source.dart';
// import 'package:dalil_hama/features/auth/domain/repository/auth_repository.dart';
// import 'package:dalil_hama/injection.dart';
// import 'package:injectable/injectable.dart';
// import 'package:logger/logger.dart';
//
// @lazySingleton
// class TokenInterceptor extends Interceptor {
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     Map<String, String> headers;
//     final login = await getIt<AuthLocalSource>().getToken();
//     if (login != null) {
//       headers = {'Authorization': 'Bearer $login'};
//       options.headers.addAll(headers);
//     }
//
//     return handler.next(options);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     AuthRepository authRepository = getIt<AuthRepository>();
//
//     try {
//       List<String> refCodes = ['0621', '0622', '0601'];
//       List<String> crashCodes = ['0623', '0624'];
//       String code = err.response?.data['code']?.toString() ?? "FUCK";
//       if (refCodes.contains(code)) {
//         var res = await authRepository.refreshToken();
//         if (res.isRight()) {
//           try {
//             if (err.requestOptions.data is FormData) {
//               FormData formData = FormData();
//               formData = err.requestOptions.data;
//               err.requestOptions.data = copyFormData(formData);
//             }
//             final response = await getIt<Dio>().fetch(err.requestOptions);
//             return handler.resolve(response);
//           } catch (e) {
//             return handler.next(err);
//           }
//         }
//       }
//
//       if (crashCodes.contains(code)) {
//         await authRepository.logOut(force: true);
//       }
//       return handler.next(err);
//     } catch (e, stack) {
//       Logger().e(e.toString(), stackTrace: stack);
//       return handler.next(err);
//     }
//   }
//
//   FormData copyFormData(FormData original) {
//     FormData newFormData = FormData();
//
//     for (var field in original.fields) {
//       newFormData.fields.add(MapEntry(field.key, field.value));
//     }
//
//     for (var file in original.files) {
//       newFormData.files.add(MapEntry(file.key, file.value.clone()));
//     }
//
//     return newFormData;
//   }
// }
