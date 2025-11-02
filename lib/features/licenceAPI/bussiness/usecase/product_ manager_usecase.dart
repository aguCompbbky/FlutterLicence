
import 'package:licence/features/licenceAPI/bussiness/entity/product.dart';
import 'package:licence/features/licenceAPI/bussiness/repository/product_repository.dart';
import 'package:licence/features/licenceAPI/data/DTO_model/product_dto.dart';


/// CRUD işlemlerini burada topladım normalde ayrı ayrı olur ama kucuk diye
class ProductManagerUsecase {
 
  ProductRepository  repo;

  ProductManagerUsecase({required this.repo});

    Future<Product> getProductById(int productId) => repo.getProductById(productId);

    Future<List<Product>> getAllProducts() => repo.getAllProducts();

    Future<void> deleteProductById(int productId) => repo.deleteProductById(productId);

    Future<Product> addProduct({required String productName, required int productAmount}) => repo.addProduct(ProductDto(id: 0, productName: productName, productAmount: productAmount));

    Future<Product> updateProduct({required int productId, required String productName, required int productAmount}) => repo.updateProduct(productId, ProductDto(id: productId, productName: productName, productAmount: productAmount));
  
}