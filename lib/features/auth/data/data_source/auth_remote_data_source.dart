import 'package:licence/client.dart';

class AuthRemoteDataSource {

  final Client client;
  AuthRemoteDataSource({required this.client});

  final _basePathAuth = "/api/auth";

  Future<Map<String,dynamic>> register(Map<String,dynamic> customer) async{
    final result = await client.dio.post<Map<String,dynamic>>("$_basePathAuth/register",data:customer);
    return result.data!;
  }

  Future<Map<String,dynamic>> login(Map<String,dynamic> loginRequest)async{
    final response = await client.dio.post<Map<String,dynamic>>("$_basePathAuth/login",data:loginRequest);
    return response.data!;
  }
}