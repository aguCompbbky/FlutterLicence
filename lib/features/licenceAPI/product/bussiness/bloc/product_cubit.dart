
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/features/licenceAPI/product/bussiness/bloc/product_state.dart';
import 'package:licence/features/licenceAPI/product/bussiness/usecase/product_%20manager_usecase.dart';

class ProductCubit extends Cubit<ProductState> {
  
  ProductManagerUsecase productUsecase;

  ProductCubit({required this.productUsecase}) : super(ProductInitialState());

  Future<void> getAllProducts() async {
      try {
        emit(ProductLoadingState());
        final productList = await productUsecase.getAllProducts();
        emit(ProductGotState(productList: productList));
      } catch (e) {
        emit(ProductErrorState(error: e.toString()));
      }
  }
  
  Future<void> getProductById(int productId) async {
    try {
      emit(ProductLoadingState());
      final product = await productUsecase.getProductById(productId);
      emit(ProductGetByIdState(product: product));
      
    } catch (e) {
      print(e.toString()+"hata");
      emit(ProductErrorState(error: e.toString()));
    }
  }

  Future<void> addProduct({required String productName, required int productAmount}) async{
    try {
      emit(ProductLoadingState());
      final addedProduct = await productUsecase.addProduct(productName: productName, productAmount: productAmount);
      emit(ProductAddedState(addedProduct: addedProduct));
      
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }

  Future<void> deleteProductById(int productId) async{
    try {
      emit(ProductLoadingState());
      await productUsecase.deleteProductById(productId);
      emit(ProductDeleteState());
      
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }

  Future<void> updateProduct({required int productId, required String productName, required int productAmount})async{
    try {
      emit(ProductLoadingState());
      final updatedProduct = await productUsecase.updateProduct(productId: productId, productName: productName, productAmount: productAmount);
      emit(ProductUpdatedState(updatedProduct: updatedProduct));
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }
}