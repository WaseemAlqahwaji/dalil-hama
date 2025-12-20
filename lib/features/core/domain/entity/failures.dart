import 'package:core_package/core_package.dart';
import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:flutter/material.dart';

class NetworkFailure extends Failure {
  @override
  String getError(BuildContext context) {
    return CoreTranslations.of(context)!.noInternetConnection;
  }
}

class TimeOutFailure extends Failure {
  @override
  String getError(BuildContext context) {
    return CoreTranslations.of(context)!.connectionTimeOut;
  }
}

class ServerFailure extends Failure {
  int code;
  String message;

  ServerFailure({required this.code, required this.message});

  @override
  String getError(BuildContext context) {
    return message;
  }
}

class InternalError extends Failure {
  @override
  String getError(BuildContext context) {
    return CoreTranslations.of(context)!.oopsSomeThingGotWrong;
  }
}
