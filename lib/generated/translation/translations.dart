import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translations_ar.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Translations
/// returned by `Translations.of(context)`.
///
/// Applications need to include `Translations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/translations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Translations.localizationsDelegates,
///   supportedLocales: Translations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Translations.supportedLocales
/// property.
abstract class Translations {
  Translations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static const LocalizationsDelegate<Translations> delegate =
      _TranslationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar')];

  /// No description provided for @map.
  ///
  /// In ar, this message translates to:
  /// **'الخريطة'**
  String get map;

  /// No description provided for @selectSection.
  ///
  /// In ar, this message translates to:
  /// **'اختر القطاع لتصفح الأماكن والخدمات'**
  String get selectSection;

  /// No description provided for @mainSections.
  ///
  /// In ar, this message translates to:
  /// **'القطاعات الرئيسية'**
  String get mainSections;

  /// No description provided for @dalilHama.
  ///
  /// In ar, this message translates to:
  /// **'دليل محافظة حماة'**
  String get dalilHama;

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'دليل حماة'**
  String get appName;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادت'**
  String get settings;

  /// No description provided for @favourites.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get favourites;

  /// No description provided for @searchForAnything.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن شيء دكتور، صيدلية، مطعم ...'**
  String get searchForAnything;

  /// No description provided for @posts.
  ///
  /// In ar, this message translates to:
  /// **'المنشورات'**
  String get posts;

  /// No description provided for @advertisements.
  ///
  /// In ar, this message translates to:
  /// **'الإعلانات'**
  String get advertisements;

  /// No description provided for @pleaseSelectCategory.
  ///
  /// In ar, this message translates to:
  /// **'رجاءاً اختر فئة'**
  String get pleaseSelectCategory;

  /// No description provided for @discover.
  ///
  /// In ar, this message translates to:
  /// **'تصفح'**
  String get discover;

  /// No description provided for @openInMap.
  ///
  /// In ar, this message translates to:
  /// **'فتح الخريطة'**
  String get openInMap;

  /// No description provided for @sendMail.
  ///
  /// In ar, this message translates to:
  /// **'ارسال بريد'**
  String get sendMail;

  /// No description provided for @call.
  ///
  /// In ar, this message translates to:
  /// **'اتصال'**
  String get call;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الالكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة السر'**
  String get password;

  /// No description provided for @emailNotValid.
  ///
  /// In ar, this message translates to:
  /// **'البريد الالكتروني غير صالح'**
  String get emailNotValid;

  /// No description provided for @yourFirstOptionToKnowHamaOmAlfidaa.
  ///
  /// In ar, this message translates to:
  /// **'خيارك الأول لتعرف كل شيء عن حماة أم الفداء'**
  String get yourFirstOptionToKnowHamaOmAlfidaa;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟'**
  String get dontHaveAnAccount;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get register;

  /// No description provided for @letsGoIntoTheDalil.
  ///
  /// In ar, this message translates to:
  /// **'هيا بنا ندخل إلى دليل حلاوة الجبن'**
  String get letsGoIntoTheDalil;

  /// No description provided for @fullname.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الكامل'**
  String get fullname;

  /// No description provided for @username.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم'**
  String get username;

  /// No description provided for @fieldRequiredMessage.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get fieldRequiredMessage;

  /// No description provided for @forgetPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgetPassword;

  /// No description provided for @restore.
  ///
  /// In ar, this message translates to:
  /// **'استعادة'**
  String get restore;

  /// No description provided for @name.
  ///
  /// In ar, this message translates to:
  /// **'الإسم'**
  String get name;

  /// No description provided for @logOut.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logOut;

  /// No description provided for @pleaseLoginFirst.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تسجيل الدخول أولاً'**
  String get pleaseLoginFirst;

  /// No description provided for @ratings.
  ///
  /// In ar, this message translates to:
  /// **'التقييمات'**
  String get ratings;

  /// No description provided for @weSendResetPasswordLinkToYourEmail.
  ///
  /// In ar, this message translates to:
  /// **'لقد أرسلنا رابط لاعادة تعيين كلمة المرور الى ايميلك'**
  String get weSendResetPasswordLinkToYourEmail;
}

class _TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const _TranslationsDelegate();

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(lookupTranslations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationsDelegate old) => false;
}

Translations lookupTranslations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return TranslationsAr();
  }

  throw FlutterError(
    'Translations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
