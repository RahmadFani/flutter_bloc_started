part of 'cart_cubit.dart';

class CartState {
  const CartState(this.productList);

  final List<CartModel> productList;

  CartState.initial() : productList = [];

  CartState productChange(List<CartModel> productList) {
    return CartState(productList);
  }

  int get totalCart => productList.length;

  bool get isEmptyCart => productList.isEmpty;

  double get totalPrice => productList.fold(
      0,
      (previousValue, element) =>
          previousValue + element.product.price! * element.quantity);
}
