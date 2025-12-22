// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class TranslationsAr extends Translations {
  TranslationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'دليل حماة';

  @override
  String get home => 'الرئيسية';

  @override
  String get settings => 'الإعدادت';

  @override
  String get map => 'الخريطة';

  @override
  String get favourites => 'المفضلة';

  @override
  String get searchForAnything => 'ابحث عن شيء دكتور، صيدلية، مطعم ...';

  @override
  String get posts => 'المنشورات';

  @override
  String get advertisements => 'الإعلانات';
}
