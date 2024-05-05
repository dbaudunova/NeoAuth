part of 'registration_bloc.dart';

abstract class RegistrationState {
  final DioException? error;

  RegistrationState({this.error});
}

class RegistrationLoading extends RegistrationState {}

class RegistrationDone extends RegistrationState {}

class RegistrationError extends RegistrationState {
  RegistrationError(DioException error) : super(error: error);
}

class ValidationState extends RegistrationState {
  final bool passwordLength;
  final bool lowerAndUpperCase;
  final bool minOneDigital;
  final bool minOneSpecialSymbol;

  ValidationState({
    super.error,
    required this.passwordLength,
    required this.lowerAndUpperCase,
    required this.minOneDigital,
    required this.minOneSpecialSymbol,
  });
}
