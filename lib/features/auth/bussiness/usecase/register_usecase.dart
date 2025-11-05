import 'package:licence/features/auth/bussiness/entity/login_response.dart';
import 'package:licence/features/auth/bussiness/repository/auth_repository.dart';
import 'package:licence/features/auth/data/DTO_model/customer_dto.dart';

class RegisterUsecase {
  RegisterUsecase({required this.repo});

  final AuthRepository repo;


   Future<LoginResponse> register({required String name, required String surname, required String email, required String password}) async => repo.register(CustomerDto(id: 0, name: name, surname: surname, email: email, password: password));


}