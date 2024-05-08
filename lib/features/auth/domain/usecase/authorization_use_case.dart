import 'package:neo_auth/features/auth/domain/model/authorization_entity.dart';
import 'package:neo_auth/features/auth/domain/repository/authorization_repository.dart';

class AuthorizationUseCase {
  final AuthorizationRepository repository;

  AuthorizationUseCase(this.repository);

  Future<AuthorizationEntity> call(String username, String password) async {
    return repository.authorizeUser(username, password);
  }
}