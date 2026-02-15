import 'package:dalil_hama/features/core/presentation/utils/ext/string.dart';

bool? isLink(String? url) {
  if (url == null) {
    return null;
  }
  final RegExp urlRegExp = RegExp(
    r'(https?|ftp)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?',
    caseSensitive: false,
  );
  return urlRegExp.hasMatch(url);
}

String? getImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return isLink(imageUrl) == true ? imageUrl : imageUrl.getUrl;
}
