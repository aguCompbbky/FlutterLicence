import 'package:licence/features/auth/bussiness/entity/login_response.dart';

abstract class AuthState {}

class AuthenticationInitialState extends AuthState{}

class AuthenticationLoadingState extends AuthState {}

class AuthenticationSuccesfulState extends AuthState{
  AuthenticationSuccesfulState({required this.response});

  final LoginResponse response;

}

class AuthenticationErrorState extends AuthState{
  AuthenticationErrorState({required this.error});

  final String error;

}