import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:neo_auth/features/auth/domain/usecase/authorization_use_case.dart';

part 'authorization_event.dart';

part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AuthorizationUseCase _authorizationUseCase;

  AuthorizationBloc(this._authorizationUseCase)
      : super(AuthorizationLoading()) {
    on<MakeAuthorization>(onAuth);
  }

  void onAuth(MakeAuthorization event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationLoading());
    try {
      await _authorizationUseCase.call(event.username, event.password);
      emit(AuthorizationDone());
    } on DioException catch (e) {
      emit(AuthorizationError(e));
    }
  }
}
