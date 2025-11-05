
import 'package:licence/features/auth/bussiness/entity/login_response.dart';
import 'package:licence/features/auth/bussiness/repository/auth_repository.dart';
import 'package:licence/features/auth/data/DTO_model/customer_dto.dart';
import 'package:licence/features/auth/data/DTO_model/login_request_dto.dart';
import 'package:licence/features/auth/data/DTO_model/login_response_dto.dart';
import 'package:licence/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl implements AuthRepository {

  String? _currentToken;

  AuthRemoteDataSource remote;
  AuthRepositoryImpl({
    required this.remote,
  });

  @override
  Future<LoginResponse> login(LoginRequestDto request) async {
    
    final body = request.toJson();

    final result = await remote.login(body); //burda token dönecek

    final account = LoginResponseDto.fromJson(result);
    
    _currentToken = account.loginToken;
  
    return account;
  }

  @override
  Future<LoginResponse> register(CustomerDto customer) async {
    final body = customer.toJson();

    final result = await remote.register(body); 

    final account = LoginResponseDto.fromJson(result);

    _currentToken = account.loginToken;

    return account;
  }
  
  @override
  Future<int> getCurrentCustomerId()async {

    final currToken =_currentToken;

    if (currToken == null) {
      throw Exception("Oturum açılmadı. Lütfen önce giriş yapın.");
    }

    try {

       Map<String, dynamic> decodedToken = JwtDecoder.decode(currToken);
       return decodedToken['sub'] as int; // eposta
      
    } catch (e) {
      _currentToken = null; 
      throw Exception("Geçersiz veya süresi dolmuş oturum.");
    }
    

  }
}
