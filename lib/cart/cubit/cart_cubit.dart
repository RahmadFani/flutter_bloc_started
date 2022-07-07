import 'package:bloc/bloc.dart';
import 'package:my_wallet/cart/cart.dart';
import 'package:product_repository/product_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addProduct(ProductModel product, context) {
    final products = state.productList;

    CartModel data = products
        .firstWhere((element) => element.product == product, orElse: () {
      return CartModel(product: product);
    });

    if (data.quantity == 0) {
      products.add(CartModel(product: product, quantity: 1));
    } else {
      products.where((element) => element.product == product).first.quantity++;
    }

    emit(state.productChange(products));
  }

  void removeProduct(ProductModel product, context) {
    final products = state.productList;

    CartModel data = products
        .firstWhere((element) => element.product == product, orElse: () {
      return CartModel(product: product);
    });

    if (data.quantity == 1) {
      products.removeWhere((element) => element.product == product);
    } else {
      products.where((element) => element.product == product).first.quantity--;
    }

    emit(state.productChange(products));
  }
}
