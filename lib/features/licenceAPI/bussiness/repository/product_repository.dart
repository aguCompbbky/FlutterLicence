import 'package:licence/features/licenceAPI/bussiness/entity/product.dart';
import 'package:licence/features/licenceAPI/data/DTO_model/product_dto.dart';

abstract class ProductRepository {
  Future<Product> getProductById(int productId);
  Future<Product> addProduct(ProductDto product);
  Future<void> deleteProductById(int productId);
  Future<List<Product>> getAllProducts();
  Future<Product> updateProduct(int productId, ProductDto product);
}