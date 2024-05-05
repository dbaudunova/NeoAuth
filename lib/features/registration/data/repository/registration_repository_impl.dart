import 'package:neo_auth/features/registration/data/data_source/remote/registration_data_source.dart';
import 'package:neo_auth/features/registration/domain/model/registration_entity.dart';
import 'package:neo_auth/features/registration/domain/repository/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationDataSource dataSource;

  RegistrationRepositoryImpl(this.dataSource);

  @override
  Future<RegistrationEntity> registerUser(
      String email, String username, String password) async {
    return await dataSource.registerUser(email, username, password);
  }
}
