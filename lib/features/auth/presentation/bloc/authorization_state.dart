part of 'authorization_bloc.dart';

abstract class AuthorizationState {
  final DioException? error;

  AuthorizationState({this.error});
}

class AuthorizationLoading extends AuthorizationState {}

class AuthorizationDone extends AuthorizationState {}

class AuthorizationError extends AuthorizationState {
  AuthorizationError(DioException error) : super(error: error);
}
