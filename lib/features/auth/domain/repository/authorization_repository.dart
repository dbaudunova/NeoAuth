import 'package:neo_auth/features/auth/domain/model/authorization_entity.dart';

abstract class AuthorizationRepository {
  Future<AuthorizationEntity> authorizeUser(String username, String password);
}