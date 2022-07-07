part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> productList;

  const ProductLoaded(this.productList);

  @override
  List<Object> get props => [productList];
}

class ProductError extends ProductState {}
