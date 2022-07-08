part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({required this.productList});

  final List<CartModel> productList;

  CartState.initial() : productList = [];

  CartState productChange(List<CartModel> productList) {
    return CartState(productList: productList);
  }

  int get totalCart => productList.length;

  bool get isEmptyCart => productList.isEmpty;

  double get totalPrice => productList.fold(
      0,
      (previousValue, element) =>
          previousValue + element.product.price! * element.quantity);

  @override
  List<Object?> get props => [productList];

  @override
  String toString() => 'ProductLoaded { product: ${productList.length}}';
}
