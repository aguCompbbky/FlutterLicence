// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:licence/features/auth/bussiness/bloc/auth_state.dart';
import 'package:licence/features/auth/bussiness/usecase/login_usecase.dart';
import 'package:licence/features/auth/bussiness/usecase/register_usecase.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUseCase;
  final RegisterUsecase registerUsecase;
  AuthCubit({required this.loginUseCase, required this.registerUsecase})
    : super(AuthenticationInitialState());

    Future<void> login(String email, String password)async{
      try {
        emit(AuthenticationLoadingState());
        final loginToken = await loginUseCase.login(email: email, password: password);
        emit(AuthenticationSuccesfulState(response: loginToken));
      } catch (e) {
        emit(AuthenticationErrorState(error: e.toString()));
      }
    }

    Future<void> register({required String name, required String surname, required String email, required String password})async{
      try {
        emit(AuthenticationLoadingState());
        final loginToken = await registerUsecase.register(name: name, surname: surname, email: email, password: password);
        emit(AuthenticationSuccesfulState(response: loginToken));
      } catch (e) {
        emit(AuthenticationErrorState(error: e.toString()));
      }
    }




}
