import 'package:licence/client.dart';

class ProductRemoteDataSource {
  final Client client;
  ProductRemoteDataSource({required this.client});

  final _basePathProduct = "/api/product";

  Future<Map<String, dynamic>> getProductById(int productId) async {
    final result = await client.dio.get<Map<String, dynamic>>(
      '$_basePathProduct/get/$productId',
    );
    print("girdi");
    return result.data!;
  }

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> product) async {
    final result = await client.dio.post<Map<String, dynamic>>(
      "$_basePathProduct/add",
      data: product,
    );
    return result.data!;
  }

  Future<void> deleteProductById(int productId) async {
    await client.dio.delete<dynamic>("$_basePathProduct/delete/${productId}");
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final result = await client.dio.get<dynamic>("$_basePathProduct/get/all");
    return List<Map<String, dynamic>>.from(result.data as List);
  }

  Future<Map<String, dynamic>> updateProduct(
    int productId,
    Map<String, dynamic> product,
  ) async {
    final result = await client.dio.put<Map<String, dynamic>>(
      "$_basePathProduct/update/$productId",
      data: product,
    );
    return result.data!;
  }
}
