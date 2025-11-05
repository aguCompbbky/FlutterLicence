
import 'package:licence/features/auth/bussiness/entity/login_response.dart';
import 'package:licence/features/auth/bussiness/repository/auth_repository.dart';
import 'package:licence/features/auth/data/DTO_model/login_request_dto.dart';

class LoginUsecase {
  final AuthRepository repo;
  LoginUsecase({
    required this.repo,
  });

  Future<LoginResponse> login({required String email, required String password}) async => repo.login(LoginRequestDto(email: email, password: password));



 


}
