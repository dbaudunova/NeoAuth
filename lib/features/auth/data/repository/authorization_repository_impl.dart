import 'package:neo_auth/features/auth/data/data_source/remote/authorization_data_source.dart';
import 'package:neo_auth/features/auth/domain/model/authorization_entity.dart';
import 'package:neo_auth/features/auth/domain/repository/authorization_repository.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {

  final AuthorizationDataSource dataSource;

  AuthorizationRepositoryImpl(this.dataSource);

  @override
  Future<AuthorizationEntity> authorizeUser(String username, String password) async {
    return await dataSource.authorizeUser(username, password);
  }
}