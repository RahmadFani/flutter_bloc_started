import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wallet/cart/cart.dart';
import 'package:product_repository/product_repository.dart';
import 'package:collection/collection.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addProduct(ProductModel product, context) {
    var products = state.productList;

    CartModel? data =
        products.firstWhereOrNull((element) => element.product == product);

    if (data == null) {
      emit(CartState(productList: [
        ...state.productList,
        CartModel(product: product, quantity: 1)
      ]));
    } else {
      final changes = products.map((e) {
        if (e.product == product) {
          return CartModel(product: product, quantity: e.quantity + 1);
        }
        return e;
      }).toList();
      emit(state.productChange(changes));
    }
  }

  void removeProduct(ProductModel product, context) {
    var products = state.productList;

    CartModel? data =
        products.firstWhereOrNull((element) => element.product == product);

    if (data?.quantity == 1) {
      emit(CartState(
          productList: [
        ...state.productList,
      ]..removeWhere((element) => element.product == product)));
    } else {
      final changes = products.map((e) {
        if (e.product == product) {
          return CartModel(product: product, quantity: e.quantity - 1);
        }
        return e;
      }).toList();
      emit(state.productChange(changes));
    }
  }
}
