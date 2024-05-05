import 'package:neo_auth/features/registration/domain/model/registration_entity.dart';
import 'package:neo_auth/features/registration/domain/repository/registration_repository.dart';

class RegistrationUseCase {
  final RegistrationRepository repository;

  RegistrationUseCase(this.repository);

  Future<RegistrationEntity> call(
    String email,
    String username,
    String password,
  ) async {
    return await repository.registerUser(email, username, password);
  }
}
