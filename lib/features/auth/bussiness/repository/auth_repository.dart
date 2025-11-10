
import 'package:licence/features/auth/bussiness/entity/login_response.dart';
import 'package:licence/features/auth/data/DTO_model/customer_dto.dart';
import 'package:licence/features/auth/data/DTO_model/login_request_dto.dart';

abstract class AuthRepository {

    Future<LoginResponse> register(CustomerDto customer);

    Future<LoginResponse> login(LoginRequestDto request);

    Future<int> getCurrentCustomerId();

    void logOut();

}