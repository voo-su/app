import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/core/grpc_interceptor.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/acccount_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/contact_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/group_chat_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/account.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/contact.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/group_chat.pbgrpc.dart';
import 'package:voo_su/data/repositories/account_repository_impl.dart';
import 'package:voo_su/data/repositories/auth_repository_impl.dart';
import 'package:voo_su/data/repositories/chat_repository_impl.dart';
import 'package:voo_su/data/repositories/contact_repository_impl.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';
import 'package:voo_su/domain/repositories/contact_repository.dart';
import 'package:voo_su/domain/usecases/account/get_acccount_usecase.dart';
import 'package:voo_su/domain/usecases/account/get_firebase_token_usecase.dart';
import 'package:voo_su/domain/usecases/account/get_notify_settings_usecase.dart';
import 'package:voo_su/domain/usecases/account/update_notify_settings_usecase.dart';
import 'package:voo_su/domain/usecases/account/update_profile_usecase.dart';
import 'package:voo_su/domain/usecases/auth/login_usecase.dart';
import 'package:voo_su/domain/usecases/auth/logout_usecase.dart';
import 'package:voo_su/domain/usecases/auth/verify_usecase.dart';
import 'package:voo_su/domain/usecases/chat/delete_messages_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_chats_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_history_usecase.dart';
import 'package:voo_su/domain/usecases/chat/send_messages_usecase.dart';
import 'package:voo_su/domain/usecases/contact/get_contacts_usecase.dart';
import 'package:voo_su/presentation/cubit/chat_updates_cubit.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';
import 'package:voo_su/presentation/screens/message_screen/bloc/message_bloc.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/settings_bloc.dart';
import 'package:voo_su/presentation/screens/settings_screen/bloc/themes_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final channel = ClientChannel(
    'grpc.voo.su',
    port: 443,
    options: const ChannelOptions(
      //credentials: ChannelCredentials.insecure(),
      credentials: ChannelCredentials.secure(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => channel);

  // Data sources - remote
  sl.registerLazySingleton(
    () => AuthRemoteDataSource(
      AuthServiceClient(
        channel,
       // interceptors: [GrpcInterceptor(sl())],
      ),
    ),
  );
  sl.registerLazySingleton(
    () => ChatRemoteDataSource(
      ChatServiceClient(
        channel,
        interceptors: [GrpcInterceptor(sl())],
      ),
    ),
  );
  sl.registerLazySingleton(
    () => ContactRemoteDataSource(
      ContactServiceClient(
        channel,
        interceptors: [GrpcInterceptor(sl())],
      ),
    ),
  );
  sl.registerLazySingleton(
    () => GroupChatRemoteDataSource(
      GroupChatServiceClient(
        channel,
        interceptors: [GrpcInterceptor(sl())],
      ),
    ),
  );
  sl.registerLazySingleton(
    () => AccountRemoteDataSource(
      AccountServiceClient(
        channel,
        interceptors: [GrpcInterceptor(sl())],
      ),
    ),
  );

  // Data sources - local
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<ContactRepository>(
    () => ContactRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(sl(), sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => VerifyUseCase(sl()));
  sl.registerLazySingleton(() => GetChatsUseCase(sl()));
  sl.registerLazySingleton(() => GetContactsUseCase(sl()));
  sl.registerLazySingleton(() => GetHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetAccountUseCase(sl()));
  sl.registerLazySingleton(() => GetNotifySettingsUseCase(sl()));
  sl.registerLazySingleton(() => UpdateNotifySettingsUseCase(sl()));
  sl.registerLazySingleton(() => SendMessagesUseCase(sl()));
  sl.registerLazySingleton(() => DeleteMessagesUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetFirebaseTokenUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
  sl.registerFactory(() => ChatBloc(sl(), sl()));
  sl.registerFactory(() => ContactBloc(sl()));
  sl.registerFactory(() => MessageBloc(sl(), sl(), sl()));
  sl.registerFactory(() => SettingsBloc(sl(), sl(), sl()));
  sl.registerFactory(() => ThemesBloc());

  // Cubit
  sl.registerFactory(() => ChatUpdatesCubit(sl()));
}
