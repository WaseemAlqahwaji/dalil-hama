// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class TranslationsAr extends Translations {
  TranslationsAr([String locale = 'ar']) : super(locale);

  @override
  String get map => 'الخريطة';

  @override
  String get selectSection => 'اختر القطاع لتصفح الأماكن والخدمات';

  @override
  String get mainSections => 'القطاعات الرئيسية';

  @override
  String get dalilHama => 'دليل محافظة حماة';

  @override
  String get appName => 'دليل حماة';

  @override
  String get home => 'الرئيسية';

  @override
  String get settings => 'الإعدادت';

  @override
  String get favourites => 'المفضلة';

  @override
  String get searchForAnything => 'ابحث عن شيء دكتور، صيدلية، مطعم ...';

  @override
  String get posts => 'المنشورات';

  @override
  String get advertisements => 'الإعلانات';

  @override
  String get pleaseSelectCategory => 'رجاءاً اختر فئة';

  @override
  String get discover => 'تصفح';

  @override
  String get openInMap => 'فتح الخريطة';

  @override
  String get sendMail => 'ارسال بريد';

  @override
  String get call => 'اتصال';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الالكتروني';

  @override
  String get password => 'كلمة السر';

  @override
  String get emailNotValid => 'البريد الالكتروني غير صالح';

  @override
  String get yourFirstOptionToKnowHamaOmAlfidaa =>
      'خيارك الأول لتعرف كل شيء عن حماة أم الفداء';

  @override
  String get dontHaveAnAccount => 'ليس لديك حساب؟';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get letsGoIntoTheDalil => 'هيا بنا ندخل إلى دليل حلاوة الجبن';

  @override
  String get fullname => 'الاسم الكامل';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get fieldRequiredMessage => 'هذا الحقل مطلوب';

  @override
  String get forgetPassword => 'نسيت كلمة المرور؟';

  @override
  String get restore => 'استعادة';
}
