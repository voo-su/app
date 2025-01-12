import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voo_su/data/data_sources/local/auth_local_data_source.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/contact_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/chat.pbgrpc.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/contact.pbgrpc.dart';
import 'package:voo_su/data/repositories/auth_repository_impl.dart';
import 'package:voo_su/data/repositories/chat_repository_impl.dart';
import 'package:voo_su/data/repositories/contact_repository_impl.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';
import 'package:voo_su/domain/repositories/chat_repository.dart';
import 'package:voo_su/domain/repositories/contact_repository.dart';
import 'package:voo_su/domain/usecases/auth/login_usecase.dart';
import 'package:voo_su/domain/usecases/auth/verify_usecase.dart';
import 'package:voo_su/domain/usecases/chat/get_chats_usecase.dart';
import 'package:voo_su/domain/usecases/contact/get_contacts_usecase.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';
import 'package:voo_su/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:voo_su/presentation/screens/contact_screen/bloc/contact_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final channel = ClientChannel(
    '192.168.0.2',
    port: 50051,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => channel);

  // Data sources - remote
  sl.registerLazySingleton(
    () => AuthRemoteDataSource(AuthServiceClient(channel)),
  );
  sl.registerLazySingleton(
    () => ChatRemoteDataSource(ChatServiceClient(channel)),
  );
  sl.registerLazySingleton(
    () => ContactRemoteDataSource(ContactServiceClient(channel)),
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

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => VerifyUseCase(sl()));
  sl.registerLazySingleton(() => GetChatsUseCase(sl()));
  sl.registerLazySingleton(() => GetContactsUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthBloc(sl(), sl()),
  );
  sl.registerFactory(() => ChatBloc(sl()));
  sl.registerFactory(() => ContactBloc(sl()));
}
