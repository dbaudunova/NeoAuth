import 'package:neo_auth/features/registration/domain/model/registration_entity.dart';

abstract class RegistrationRepository {
  Future<RegistrationEntity> registerUser(String email, String username, String password);
}