part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class MakeAuthorization extends AuthorizationEvent {
  final String username;
  final String password;

  MakeAuthorization({
    required this.username,
    required this.password,
  });
}
