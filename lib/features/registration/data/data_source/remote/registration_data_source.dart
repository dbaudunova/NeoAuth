import 'package:dio/dio.dart';
import 'package:neo_auth/features/registration/data/model/registration_model.dart';

abstract class RegistrationDataSource {
  Future<RegistrationModel> registerUser(
      String email, String username, String password);
}

class RegistrationDataSourceImpl implements RegistrationDataSource {
  @override
  Future<RegistrationModel> registerUser(
      String email, String username, String password) async {
    final registrationModel = RegistrationModel(
      email: email,
      username: username,
      password: password,
    );
    const url = 'https://atai-mamytov.click/neoauth/users/registration/';

    final dio = Dio(
      BaseOptions(
        headers: {
          'accept': 'application/json',
          'content-type': 'application/json'
        },
      ),
    );

    final response = await dio.post(url, data: registrationModel.toJson());
    return RegistrationModel.fromJson(response.data);
  }
}
