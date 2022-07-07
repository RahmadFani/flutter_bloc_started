import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/home/home.dart';
import 'package:my_wallet/home/view/home_product.dart';
import 'package:my_wallet/product/cubit/product_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
      if (state is ProductInitial) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductLoaded) {
        return HomeProduct(productList: state.productList);
      }
      return const SizedBox.shrink();
    });
  }
}
