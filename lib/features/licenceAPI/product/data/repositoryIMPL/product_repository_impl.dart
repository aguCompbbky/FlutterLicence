
import 'package:licence/features/licenceAPI/product/bussiness/entity/product.dart';
import 'package:licence/features/licenceAPI/product/bussiness/repository/product_repository.dart';
import 'package:licence/features/licenceAPI/product/data/DTO_model/product_dto.dart';
import 'package:licence/features/licenceAPI/product/data/data_source/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remote;
  ProductRepositoryImpl({
    required this.remote,
  });

  @override
  Future<Product> addProduct(ProductDto product) async {
   
    final body = product.toJson(); //jsona çevir

    final result = await remote.addProduct(body); // fonksiyona jsonlu formatta verdik

    final addedProduct = ProductDto.fromJson(result);

    return addedProduct;

  }

  @override
  Future<void> deleteProductById(int productId) async {
    await remote.deleteProductById(productId);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final result = await remote.getAllProducts();
    return result.map((e)=>ProductDto.fromJson(e)).toList();
  }

  @override
  Future<Product> getProductById(int productId) async {
   final result = await remote.getProductById(productId);
   return ProductDto.fromJson(result);
  }

  @override
  Future<Product> updateProduct(int productId, ProductDto product) async {

    final jsonProduct = product.toJson();

    final result = await remote.updateProduct(productId, jsonProduct);

    return ProductDto.fromJson(result);
  }
  
}
