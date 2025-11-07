
import 'package:flutter/widgets.dart';
import 'package:licence/features/auth/bussiness/entity/login_response.dart';
import 'package:licence/features/auth/bussiness/repository/auth_repository.dart';
import 'package:licence/features/auth/data/DTO_model/customer_dto.dart';
import 'package:licence/features/auth/data/DTO_model/login_request_dto.dart';
import 'package:licence/features/auth/data/DTO_model/login_response_dto.dart';
import 'package:licence/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {

  String? _currentToken;

  AuthRemoteDataSource remote;
  AuthRepositoryImpl._internal({required this.remote});


  static Future<AuthRepositoryImpl> create({required AuthRemoteDataSource remote}) async {
    final instance = AuthRepositoryImpl._internal(remote: remote);
    
    // Yükleme tamamlanana kadar BEKLE
    await instance._loadToken(); 
    
    return instance;
  }

  Future<void> _loadToken() async {
  final prefs = await SharedPreferences.getInstance();
  _currentToken = prefs.getString('jwt_token'); // tokenı cacheden getir
  debugPrint("$_currentToken loadTokenden gellen token");
}

  @override
  Future<LoginResponse> login(LoginRequestDto request) async {
    
    final body = request.toJson();

    final result = await remote.login(body); //burda token dönecek

    debugPrint("${result} çekilen token");

    final account = LoginResponseDto.fromJson(result);
    
   debugPrint("${account.loginToken} çekilen token account");

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', account.loginToken);
  
    return account;
  }

  @override
  Future<LoginResponse> register(CustomerDto customer) async {
    final body = customer.toJson();

    final result = await remote.register(body); 

    final account = LoginResponseDto.fromJson(result);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt_token', account.loginToken);

    return account;
  }
  
  @override
  Future<int> getCurrentCustomerId()async {

    final currToken =_currentToken;
    debugPrint("$currToken currToken");

    if (currToken == null) {
      throw Exception("Oturum açılmadı. Lütfen önce giriş yapın.");
    }

    try {
      
       Map<String, dynamic> decodedToken = JwtDecoder.decode(currToken);
       debugPrint((decodedToken['sub']).runtimeType.toString()+"decodedTokensub tipi ${decodedToken['sub']}"); //String dönüyor idyi dönüyor ama orası doğru neden cast edemiyor
       return int.parse(decodedToken['sub'] as String); // id
      
    } catch (e) {
      //_currentToken = null; 
      
      throw Exception("Token çözülemedi AuthRepositoryImpl-57 .${e.toString()}");
    }
    

  }
}
