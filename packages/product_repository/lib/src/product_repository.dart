import 'package:product_repository/product_repository.dart';

class ProductRepository {
  ProductRepository();

  Future<List<ProductModel>> getAllProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ProductModel(
        id: '1',
        name: 'Product 1',
        description: 'This is a product',
        price: 10.0,
        quantity: 10,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      ProductModel(
        id: '2',
        name: 'Product 2',
        description: 'This is a product',
        price: 20.0,
        quantity: 20,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      ProductModel(
        id: '3',
        name: 'Product 3',
        description: 'This is a product',
        price: 30.0,
        quantity: 30,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      // product 4 is not available in quantity
      ProductModel(
        id: '4',
        name: 'Product 4',
        description: 'This is a product',
        price: 40.0,
        quantity: 0,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      // product 5
      ProductModel(
        id: '5',
        name: 'Product 5',
        description: 'This is a product',
        price: 50.0,
        quantity: 50,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      // product 6
      ProductModel(
        id: '6',
        name: 'Product 6',
        description: 'This is a product',
        price: 60.0,
        quantity: 60,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      // product 7
      ProductModel(
        id: '7',
        name: 'Product 7',
        description: 'This is a product',
        price: 70.0,
        quantity: 70,
        imageUrl: 'https://via.placeholder.com/100',
      ),
      // product 8
      ProductModel(
        id: '8',
        name: 'Product 8',
        description: 'This is a product',
        price: 80.0,
        quantity: 80,
        imageUrl: 'https://via.placeholder.com/100',
      ),
    ];
  }
}
