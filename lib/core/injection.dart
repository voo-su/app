import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:voo_su/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:voo_su/data/data_sources/remote/grpc/gen/dart/pb/auth.pbgrpc.dart';
import 'package:voo_su/data/repositories/auth_repository_impl.dart';
import 'package:voo_su/domain/repositories/auth_repository.dart';
import 'package:voo_su/domain/usecases/auth/login_usecase.dart';
import 'package:voo_su/presentation/screens/auth_screen/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final channel = ClientChannel(
    '192.168.0.2',
    port: 50051,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  sl.registerLazySingleton(() => channel);

  // Data sources
  sl.registerLazySingleton(() => AuthRemoteDataSource(AuthServiceClient(channel)));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => AuthBloc(sl()),
  );
}
