import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/generated/grpc_pb/account.pb.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';

class GetNotifySettingsUseCase implements UseCase<NotifySettings, NotifyEntity> {
  final AccountRepository repository;

  GetNotifySettingsUseCase(this.repository);

  @override
  Future<Either<Failure, NotifySettings>> call(NotifyEntity entity) async {
    return await repository.getNotifySettings(entity);
  }
}
