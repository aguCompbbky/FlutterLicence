import 'package:equatable/equatable.dart';
import 'package:licence/features/licenceAPI/bussiness/entity/product.dart';

abstract class ProductState extends Equatable{
  @override
  List<Object> get props => [];
  //update kontrolunde bir şey değişmezse UI ı bastan çizmesin diye
} 

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState{}


//add
class ProductAddedState extends ProductState{
  final Product addedProduct;
  ProductAddedState({required this.addedProduct});
}

//get
class ProductGotState extends ProductState{
  ProductGotState({required this.productList});
  final List<Product>  productList;
}


//delete
class ProductDeleteState extends ProductState{}

//update
class ProductUpdatedState extends ProductState{
  final Product updatedProduct;
  ProductUpdatedState({required this.updatedProduct});
}

class ProductGetByIdState extends ProductState{
  final Product product;
  ProductGetByIdState({required this.product});
}


class ProductErrorState extends ProductState{
  final String error;
  ProductErrorState({required this.error});
}