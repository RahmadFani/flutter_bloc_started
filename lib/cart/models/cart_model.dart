import 'package:product_repository/product_repository.dart';

class CartModel {
  CartModel({required this.product, this.quantity = 0});

  ProductModel product;
  int quantity;

  double get totalPrice => product.price ?? 0.0 * quantity;
}
