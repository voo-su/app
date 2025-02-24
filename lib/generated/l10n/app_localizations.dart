import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en')
  ];

  /// No description provided for @greeting.
  ///
  /// In ru, this message translates to:
  /// **'Мы так рады видеть вас'**
  String get greeting;

  /// No description provided for @loginOrRegister.
  ///
  /// In ru, this message translates to:
  /// **'Вход или регистрация'**
  String get loginOrRegister;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get login;

  /// No description provided for @enterCode.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get enterCode;

  /// No description provided for @enterCodeBelow.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите в форму ниже код, который мы отправили вам.'**
  String get enterCodeBelow;

  /// No description provided for @confirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// No description provided for @noChats.
  ///
  /// In ru, this message translates to:
  /// **'Чатов пока нет'**
  String get noChats;

  /// No description provided for @pleaseWait.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, подождите...'**
  String get pleaseWait;

  /// No description provided for @errorOccurred.
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get errorOccurred;

  /// No description provided for @chats.
  ///
  /// In ru, this message translates to:
  /// **'Чаты'**
  String get chats;

  /// No description provided for @contacts.
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get contacts;

  /// No description provided for @nothingFound.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get nothingFound;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @termsText1.
  ///
  /// In ru, this message translates to:
  /// **'Настоящее Соглашение регламентирует отношения между Администрацией информационного ресурса «Voo.su» и физическим лицом, которое ищет и распространяет информацию на данном ресурсе.'**
  String get termsText1;

  /// No description provided for @termsText2.
  ///
  /// In ru, this message translates to:
  /// **'Информационный ресурс «Voo.su» не является средством массовой информации, Администрация ресурса не осуществляет редактирование размещаемой информации и не несет ответственность за ее содержание.'**
  String get termsText2;

  /// No description provided for @termsText3.
  ///
  /// In ru, this message translates to:
  /// **'Пользователь, разместивший информацию на ресурсе «Voo.su», самостоятельно представляет и защищает свои интересы, возникающие в связи с размещением указанной информации, в отношениях с третьими лицами.'**
  String get termsText3;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
