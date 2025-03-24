// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get greeting => 'Мы так рады видеть вас';

  @override
  String get loginOrRegister => 'Вход или регистрация';

  @override
  String get login => 'Войти';

  @override
  String get enterCode => 'Введите код';

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
  String get settings => 'Настройки';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get search => 'Поиск';

  @override
  String get termsText1 => 'Настоящее Соглашение регламентирует отношения между Администрацией информационного ресурса «Voo.su» и физическим лицом, которое ищет и распространяет информацию на данном ресурсе.';

  @override
  String get termsText2 => 'Информационный ресурс «Voo.su» не является средством массовой информации, Администрация ресурса не осуществляет редактирование размещаемой информации и не несет ответственность за ее содержание.';

  @override
  String get termsText3 => 'Пользователь, разместивший информацию на ресурсе «Voo.su», самостоятельно представляет и защищает свои интересы, возникающие в связи с размещением указанной информации, в отношениях с третьими лицами.';

  @override
  String get writeMessage => 'Написать сообщение';

  @override
  String get selectContact => 'Выберите контакт';

  @override
  String get createGroup => 'Создать группу';

  @override
  String get email => 'Email';

  @override
  String get acceptTerms => 'Нажимая «Войти», вы соглашаетесь с';

  @override
  String get termsOfUse => 'условиями использования';

  @override
  String get expiredConfirmationTime => 'Истекло время для подтверждения';

  @override
  String resendCodeAfter(Object seconds) {
    return 'Вы сможете отправить код повторно через $seconds сек.';
  }

  @override
  String get resend => 'Повторить';

  @override
  String get addMembers => 'Добавить участников';

  @override
  String get done => 'Готово';

  @override
  String get contactsLoadError => 'Ошибка загрузки контактов';

  @override
  String get groupName => 'Название группы';

  @override
  String get next => 'Далее';

  @override
  String get enterGroupName => 'Введите название группы';

  @override
  String get groupCreated => 'Группа успешно создана';

  @override
  String get add => 'Добавить';

  @override
  String get leaveGroup => 'Покинуть группу';

  @override
  String get leave => 'Покинуть';

  @override
  String get confirmLeaveGroup => 'Вы уверены, что хотите покинуть группу?';

  @override
  String get cancel => 'Отмена';

  @override
  String get membersAdded => 'Участники добавлены';

  @override
  String get leftGroup => 'Вы покинули группу';

  @override
  String get groupInfo => 'Информация о группе';

  @override
  String get members => 'участников';

  @override
  String get notifications => 'Уведомления';

  @override
  String get removeMembers => 'Удалить участников';

  @override
  String get noMembers => 'Нет участников';

  @override
  String get error => 'Ошибка:';

  @override
  String get noData => 'Нет данных';

  @override
  String get removeMember => 'Удалить участника';

  @override
  String get unknownMessageType => 'Неизвестный тип сообщения:';

  @override
  String get reply => 'Ответить';

  @override
  String get select => 'Выбрать';

  @override
  String get copy => 'Скопировать';

  @override
  String get delete => 'Удалить';

  @override
  String get you => 'Вы';

  @override
  String get messageCopied => 'Сообщение скопировано';

  @override
  String get messageDeleted => 'Сообщение удалено';

  @override
  String get noMessages => 'Нет сообщений';

  @override
  String get selected => 'Выбрано:';

  @override
  String get disableNotifications => 'Выключить уведомления';

  @override
  String get enableNotifications => 'Включить уведомления';

  @override
  String get searchByUsername => 'Поиск по имени пользователя';

  @override
  String get personalData => 'Личные данные';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get gender => 'Пол';

  @override
  String get dateOfBirth => 'Дата рождения';

  @override
  String get aboutMe => 'О себе';

  @override
  String get save => 'Сохранить';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get selectBirthDate => 'Выбрать дату рождения';

  @override
  String get personalChats => 'Личные чаты';

  @override
  String get groups => 'Группы';

  @override
  String get dataLoadError => 'Ошибка загрузки данных';

  @override
  String get edit => 'Изменить';

  @override
  String get important => 'Важное';

  @override
  String get appearance => 'Оформление';

  @override
  String get logout => 'Выйти';

  @override
  String get chooseTheme => 'Выберите тему';

  @override
  String get lightTheme => 'Светлая';

  @override
  String get darkTheme => 'Темная';

  @override
  String get rules => 'Правила';

  @override
  String get photoSelected => 'Фото выбрано';

  @override
  String get ok => 'ОК';

  @override
  String get allowPhotoAccess => 'Разрешите доступ к фото в настройках';

  @override
  String get sendMessage => 'Отправить сообщение';

  @override
  String get deleteContact => 'Удалить контакт';

  @override
  String get sunday => 'Вс';

  @override
  String get monday => 'Пн';

  @override
  String get tuesday => 'Вт';

  @override
  String get wednesday => 'Ср';

  @override
  String get thursday => 'Чт';

  @override
  String get friday => 'Пт';

  @override
  String get saturday => 'Сб';

  @override
  String get deleteGroup => 'Удалить группу';

  @override
  String get confirmDeleteGroup => 'Вы точно хотите удалить группу?';

  @override
  String get groupDeleted => 'Группа успешно удалена';

  @override
  String get editGroup => 'Редактировать';

  @override
  String get groupDescription => 'Описание группы';

  @override
  String get uploadPhoto => 'Загрузить фото';

  @override
  String get uploadFile => 'Загрузить файл';

  @override
  String get fileSelected => 'Файл выбран';

  @override
  String get fileWillBeSent => 'Ваш файл будет отправлен';

  @override
  String get allowFileAccess => 'Разрешите доступ к файлам в настройках';

  @override
  String get fileUploadError => 'Ошибка загрузки файла';

  @override
  String get fileUploadSuccess => 'Файл успешно загружен';
}
