// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get greeting => 'Мы так рады видеть вас';

  @override
  String get loginOrRegister => 'Вход или регистрация';

  @override
  String get login => 'Войти';

  @override
  String get enterCode => 'Войти';

  @override
  String get enterCodeBelow => 'Пожалуйста, введите в форму ниже код, который мы отправили вам.';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get noChats => 'Чатов пока нет';

  @override
  String get pleaseWait => 'Пожалуйста, подождите...';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get chats => 'Чаты';

  @override
  String get contacts => 'Контакты';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get search => 'Поиск';
}
