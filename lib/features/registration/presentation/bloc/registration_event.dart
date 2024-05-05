part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class MakeRegister extends RegistrationEvent {
  final String email;
  final String username;
  final String password;

  MakeRegister({
    required this.email,
    required this.username,
    required this.password,
  });
}

class Validation extends RegistrationEvent {
  final String password;

  Validation({required this.password});
}
