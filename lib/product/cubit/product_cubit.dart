import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({ProductRepository? repository})
      : _repository = repository ?? ProductRepository(),
        super(ProductInitial());

  final ProductRepository _repository;

  void init() {
    getAllProduct();
  }

  void getAllProduct() async {
    List<ProductModel> productList = await _repository.getAllProducts();
    emit(ProductLoaded(productList));
  }
}
