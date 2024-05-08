import 'package:dio/dio.dart';
import 'package:neo_auth/features/auth/data/model/authorization_model.dart';
import 'package:neo_auth/features/registration/data/data_source/remote/registration_data_source.dart';

abstract class AuthorizationDataSource {
  Future<AuthorizationModel> authorizeUser(String username, String password);
}

class AuthorizationDataSourceImpl implements AuthorizationDataSource {
  final Dio _dio;

  AuthorizationDataSourceImpl()
      : _dio = Dio(BaseOptions(
          headers: {
            'accept': 'application/json',
            'content-type': 'application/json',
          },
          contentType: Headers.jsonContentType,
        ));

  @override
  Future<AuthorizationModel> authorizeUser(
      String username, String password) async {
    final authorizationModel =
        AuthorizationModel(username: username, password: password);
    const url = 'https://atai-mamytov.click/neoauth/users/login/';
    final response = await _dio.post(url, data: authorizationModel.toJson());
    return AuthorizationModel.fromJson(response.data);
  }
}