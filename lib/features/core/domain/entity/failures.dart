import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure {
  String getError(BuildContext context) {
    if (this is ServerFailure) {
      return (this as ServerFailure).msg;
    }
    if (this is CustomFailure) {
      return (this as CustomFailure).message;
    }
    if (this is NetworkFailure) {
      return CoreTranslations.of(context)!.noInternetConnection;
    }
    return CoreTranslations.of(context)!.errorMessage;
  }
}

class ServerFailure extends Failure {
  final dynamic code;
  final String msg;

  ServerFailure({required this.code, this.msg = ''});
}

class CustomFailure extends Failure {
  final String message;

  CustomFailure({required this.message});
}

class NetworkFailure extends Failure {
  final bool connectionTimeOut;

  NetworkFailure({this.connectionTimeOut = false});
}

class UserISNotVerifiedFailure extends Failure {
  UserISNotVerifiedFailure();
}
