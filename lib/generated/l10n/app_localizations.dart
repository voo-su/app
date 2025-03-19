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
  /// **'Введите код'**
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

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

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

  /// No description provided for @writeMessage.
  ///
  /// In ru, this message translates to:
  /// **'Написать сообщение'**
  String get writeMessage;

  /// No description provided for @selectContact.
  ///
  /// In ru, this message translates to:
  /// **'Выберите контакт'**
  String get selectContact;

  /// No description provided for @createGroup.
  ///
  /// In ru, this message translates to:
  /// **'Создать группу'**
  String get createGroup;

  /// No description provided for @email.
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @acceptTerms.
  ///
  /// In ru, this message translates to:
  /// **'Нажимая «Войти», вы соглашаетесь с'**
  String get acceptTerms;

  /// No description provided for @termsOfUse.
  ///
  /// In ru, this message translates to:
  /// **'условиями использования'**
  String get termsOfUse;

  /// No description provided for @expiredConfirmationTime.
  ///
  /// In ru, this message translates to:
  /// **'Истекло время для подтверждения'**
  String get expiredConfirmationTime;

  /// No description provided for @resendCodeAfter.
  ///
  /// In ru, this message translates to:
  /// **'Вы сможете отправить код повторно через {seconds} сек.'**
  String resendCodeAfter(Object seconds);

  /// No description provided for @resend.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get resend;

  /// No description provided for @addMembers.
  ///
  /// In ru, this message translates to:
  /// **'Добавить участников'**
  String get addMembers;

  /// No description provided for @done.
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get done;

  /// No description provided for @contactsLoadError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки контактов'**
  String get contactsLoadError;

  /// No description provided for @groupName.
  ///
  /// In ru, this message translates to:
  /// **'Назовите группу'**
  String get groupName;

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// No description provided for @enterGroupName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название группы'**
  String get enterGroupName;

  /// No description provided for @groupCreated.
  ///
  /// In ru, this message translates to:
  /// **'Группа успешно создана'**
  String get groupCreated;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @leaveGroup.
  ///
  /// In ru, this message translates to:
  /// **'Покинуть группу'**
  String get leaveGroup;

  /// No description provided for @leave.
  ///
  /// In ru, this message translates to:
  /// **'Покинуть'**
  String get leave;

  /// No description provided for @confirmLeaveGroup.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите покинуть группу?'**
  String get confirmLeaveGroup;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @membersAdded.
  ///
  /// In ru, this message translates to:
  /// **'Участники добавлены'**
  String get membersAdded;

  /// No description provided for @leftGroup.
  ///
  /// In ru, this message translates to:
  /// **'Вы покинули группу'**
  String get leftGroup;

  /// No description provided for @groupInfo.
  ///
  /// In ru, this message translates to:
  /// **'Информация о группе'**
  String get groupInfo;

  /// No description provided for @members.
  ///
  /// In ru, this message translates to:
  /// **'участников'**
  String get members;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @removeMembers.
  ///
  /// In ru, this message translates to:
  /// **'Удалить участников'**
  String get removeMembers;

  /// No description provided for @noMembers.
  ///
  /// In ru, this message translates to:
  /// **'Нет участников'**
  String get noMembers;

  /// No description provided for @error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка:'**
  String get error;

  /// No description provided for @noData.
  ///
  /// In ru, this message translates to:
  /// **'Нет данных'**
  String get noData;

  /// No description provided for @removeMember.
  ///
  /// In ru, this message translates to:
  /// **'Удалить участника'**
  String get removeMember;

  /// No description provided for @unknownMessageType.
  ///
  /// In ru, this message translates to:
  /// **'Неизвестный тип сообщения:'**
  String get unknownMessageType;

  /// No description provided for @reply.
  ///
  /// In ru, this message translates to:
  /// **'Ответить'**
  String get reply;

  /// No description provided for @select.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get select;

  /// No description provided for @copy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать'**
  String get copy;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @you.
  ///
  /// In ru, this message translates to:
  /// **'Вы'**
  String get you;

  /// No description provided for @messageCopied.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение скопировано'**
  String get messageCopied;

  /// No description provided for @messageDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Сообщение удалено'**
  String get messageDeleted;

  /// No description provided for @noMessages.
  ///
  /// In ru, this message translates to:
  /// **'Нет сообщений'**
  String get noMessages;

  /// No description provided for @selected.
  ///
  /// In ru, this message translates to:
  /// **'Выбрано:'**
  String get selected;

  /// No description provided for @disableNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Выключить уведомления'**
  String get disableNotifications;

  /// No description provided for @enableNotifications.
  ///
  /// In ru, this message translates to:
  /// **'Включить уведомления'**
  String get enableNotifications;

  /// No description provided for @searchByUsername.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по имени пользователя'**
  String get searchByUsername;

  /// No description provided for @personalData.
  ///
  /// In ru, this message translates to:
  /// **'Личные данные'**
  String get personalData;

  /// No description provided for @firstName.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get lastName;

  /// No description provided for @gender.
  ///
  /// In ru, this message translates to:
  /// **'Пол'**
  String get gender;

  /// No description provided for @dateOfBirth.
  ///
  /// In ru, this message translates to:
  /// **'Дата рождения'**
  String get dateOfBirth;

  /// No description provided for @aboutMe.
  ///
  /// In ru, this message translates to:
  /// **'О себе'**
  String get aboutMe;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @male.
  ///
  /// In ru, this message translates to:
  /// **'Мужской'**
  String get male;

  /// No description provided for @female.
  ///
  /// In ru, this message translates to:
  /// **'Женский'**
  String get female;

  /// No description provided for @selectBirthDate.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать дату рождения'**
  String get selectBirthDate;

  /// No description provided for @personalChats.
  ///
  /// In ru, this message translates to:
  /// **'Личные чаты'**
  String get personalChats;

  /// No description provided for @groups.
  ///
  /// In ru, this message translates to:
  /// **'Группы'**
  String get groups;

  /// No description provided for @dataLoadError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки данных'**
  String get dataLoadError;

  /// No description provided for @edit.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get edit;

  /// No description provided for @important.
  ///
  /// In ru, this message translates to:
  /// **'Важное'**
  String get important;

  /// No description provided for @appearance.
  ///
  /// In ru, this message translates to:
  /// **'Оформление'**
  String get appearance;

  /// No description provided for @logout.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// No description provided for @chooseTheme.
  ///
  /// In ru, this message translates to:
  /// **'Выберите тему'**
  String get chooseTheme;

  /// No description provided for @lightTheme.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In ru, this message translates to:
  /// **'Темная'**
  String get darkTheme;

  /// No description provided for @rules.
  ///
  /// In ru, this message translates to:
  /// **'Правила'**
  String get rules;

  /// No description provided for @photoSelected.
  ///
  /// In ru, this message translates to:
  /// **'Фото выбрано'**
  String get photoSelected;

  /// No description provided for @ok.
  ///
  /// In ru, this message translates to:
  /// **'ОК'**
  String get ok;

  /// No description provided for @allowPhotoAccess.
  ///
  /// In ru, this message translates to:
  /// **'Разрешите доступ к фото в настройках'**
  String get allowPhotoAccess;

  /// No description provided for @sendMessage.
  ///
  /// In ru, this message translates to:
  /// **'Отправить сообщение'**
  String get sendMessage;

  /// No description provided for @deleteContact.
  ///
  /// In ru, this message translates to:
  /// **'Удалить контакт'**
  String get deleteContact;

  /// No description provided for @sunday.
  ///
  /// In ru, this message translates to:
  /// **'Вс'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In ru, this message translates to:
  /// **'Пн'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In ru, this message translates to:
  /// **'Вт'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In ru, this message translates to:
  /// **'Ср'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In ru, this message translates to:
  /// **'Чт'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In ru, this message translates to:
  /// **'Пт'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In ru, this message translates to:
  /// **'Сб'**
  String get saturday;

  /// No description provided for @deleteGroup.
  ///
  /// In ru, this message translates to:
  /// **'Удалить группу'**
  String get deleteGroup;

  /// No description provided for @confirmDeleteGroup.
  ///
  /// In ru, this message translates to:
  /// **'Вы точно хотите удалить группу?'**
  String get confirmDeleteGroup;

  /// No description provided for @groupDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Группа успешно удалена'**
  String get groupDeleted;
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
