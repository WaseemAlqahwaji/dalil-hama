import 'dart:convert';

import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/domain/entity/failures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

mixin ApiHandler {
  final Logger _logger = Logger();

  Future<Either<Failure, T>> request<T>(
    FutureEitherFailureOrData<T> body,
  ) async {
    try {
      return await body();
    } on DioException catch (e, stack) {
      _logger.e(e.toString(), error: e, stackTrace: stack);
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left(TimeOutFailure());
      } else if (e.type == DioExceptionType.badResponse) {
        Map<String, dynamic> errorBody = {};
        try {
          if (e.response?.data != null) {
            if (e.response?.data is String) {
              errorBody = jsonDecode(e.response!.data!);
            } else {
              errorBody = e.response?.data ?? {};
            }
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        return left(
          ServerFailure(
            code: e.response?.statusCode ?? -1,
            message: errorBody['message'] ?? 'حدث خطأ',
          ),
        );
      } else {
        return left(InternalError());
      }
    } catch (e, stack) {
      _logger.e(e.toString(), error: e, stackTrace: stack);
      return left(InternalError());
    }
  }
}
