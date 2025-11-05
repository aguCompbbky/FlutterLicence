
import 'package:licence/client.dart';

class LicenceRemoteDataSource {
  final Client client;
  LicenceRemoteDataSource({
    required this.client,
  });
  final _basePathLicence = "/api/licence";
  final _basePathCustomer = "/api/customer";

  Future<List<Map<String, dynamic>>> getAllLicences() async{
    final resultList = await client.dio.get<Map<String, dynamic>>(
      "$_basePathLicence/list");
      return List<Map<String, dynamic>>.from(resultList as List);
  }

  Future<Map<String, dynamic>> getLicenceById(int id)async{
    final result = await client.dio.get<Map<String, dynamic>>("$_basePathLicence/get/$id");
    return result.data!;
  }

  Future<void> deleteLicence(int id) async {
    await client.dio.delete<Map<String, dynamic>>("$_basePathLicence/delete/$id");
  }

  Future<Map<String, dynamic>> updateLicence(int id, Map<String, dynamic> licence) async {
    final result = await client.dio.put<Map<String, dynamic>>("$_basePathLicence/update/$id",data:licence);
    return result.data!;
   }

  Future<Map<String, dynamic>> addLicenseToCustomer(int customerId,Map<String, dynamic> licence)async{
    final result = await client.dio.post<Map<String, dynamic>>("$_basePathCustomer/post/$customerId/licenses",data: licence);
    return result.data!;
  }

  Future<List<Map<String, dynamic>>> getLicensesOfCustomer (int customerId)async{
    final resultList = await client.dio.get<Map<String, dynamic>>("$_basePathCustomer/get/$customerId/licenses");
    return List<Map<String, dynamic>>.from(resultList as List);
  }

  
}
