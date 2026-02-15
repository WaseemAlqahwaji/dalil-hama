import 'package:dalil_hama/configuration.dart';
import 'package:injectable/injectable.dart';

@singleton
class FileManager {
  final Configuration configuration;

  FileManager(this.configuration);

  String? getFile({String? name}) {
    if (name == null) {
      return null;
    }
    return "${configuration.imageBaseurl}$name";
  }
}
