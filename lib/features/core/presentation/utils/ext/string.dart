
import 'package:dalil_hama/features/core/presentation/utils/file_manager.dart';
import 'package:dalil_hama/injection.dart';

extension Utils2 on String {
  String noSyria() {
    if (startsWith("+963")) {
      return split("+963").last;
    }
    if (startsWith("0")) {
      return split("0").last;
    }
    return this;
  }

  String addSyria() {
    String res = startsWith("0") ? split("0").last : this;
    return "+963$res";
  }

  String? get getUrl {
    return getIt<FileManager>().getFile(name: this);
  }
}
