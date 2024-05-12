import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_auth/features/registration/domain/usecase/registration_use_case.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegistrationUseCase _registrationUseCase;

  RegistrationBloc(this._registrationUseCase) : super(RegistrationLoading()) {
    on<MakeRegister>(onRegister);
    on<Validation>(onValidation);
  }

  void onRegister(MakeRegister event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    try {
      await _registrationUseCase.call(
          event.email, event.username, event.password);
      emit(RegistrationDone());
    } on DioException catch (e) {
      emit(RegistrationError(e));
    }
  }

  void onValidation(Validation event, Emitter<RegistrationState> emit) async {
    final validLength =
        event.password.length >= 8 && event.password.length <= 15;
    final hasUpperAndLowerCase =
        event.password.contains(RegExp(r'[A-Z]')) &&
            event.password.contains(RegExp(r'[a-z]'));
    final hasDigits = event.password.contains(RegExp(r'[0-9]'));
    final hasSpecialSymbols =
        event.password.contains(RegExp(r'[+_\!=;-@#$%^&*/(),.?":{}|<>]'));

    emit(
      ValidationState(
        passwordLength: validLength,
        lowerAndUpperCase: hasUpperAndLowerCase,
        minOneDigital: hasDigits,
        minOneSpecialSymbol: hasSpecialSymbols,
      ),
    );
  }
}
