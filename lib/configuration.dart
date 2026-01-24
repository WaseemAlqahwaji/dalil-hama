import 'package:injectable/injectable.dart';

abstract class Configuration {
  String get getBaseUrl;
}

@Singleton(as: Configuration, env: ["dev"])
class DevConfiguration extends Configuration {
  @override
  String get getBaseUrl =>
      "http://ec2-51-20-92-68.eu-north-1.compute.amazonaws.com:5001/";
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
