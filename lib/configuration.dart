import 'package:injectable/injectable.dart';

abstract class Configuration {
  String get getBaseUrl;
  String get imageBaseurl;
}

@Singleton(as: Configuration, env: ["dev"])
class DevConfiguration extends Configuration {
  @override
  String get getBaseUrl =>
      "http://hamaguide-alb-1031439526.eu-north-1.elb.amazonaws.com/";

  @override
  String get imageBaseurl =>
      "http://hamaguide-alb-1031439526.eu-north-1.elb.amazonaws.com";
}

class AppEnvironment {
  /// name of the environment
  final String name;

  /// default constructor
  const AppEnvironment(this.name);

  /// preset of common env name 'dev'
  static const dev = 'dev';

  /// preset of common env name 'prod'
  static const prod = 'prod';

  /// preset of common env name 'test'
  static const staging = 'staging';
}
