import 'package:dartz/dartz.dart';
import 'package:voo_su/core/error/failures.dart';
import 'package:voo_su/core/usecase.dart';
import 'package:voo_su/domain/entities/notify_settings.dart';
import 'package:voo_su/domain/repositories/account_repository.dart';

class UpdateNotifySettingsUseCase implements UseCase<bool, UpdateNotifySettings> {
  final AccountRepository repository;

  UpdateNotifySettingsUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateNotifySettings notifySettings) async {
    return await repository.updateNotifySettings(notifySettings);
  }
}
