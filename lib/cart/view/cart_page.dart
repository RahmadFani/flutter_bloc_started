import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/cart/cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static Route get route =>
      MaterialPageRoute(builder: (context) => const CartPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: PreferredSize(
            child: SizedBox(
              width: double.infinity,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Center(
                    child: Text(
                      'My Cart',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(80)),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.productList.isEmpty) {
              return const Center(child: Text('No items in cart'));
            }
            return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (_, index) {
                  final product = state.productList[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 70,
                          height: double.infinity,
                          child: Image.network(
                            product.product.imageUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${product.product.name}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '\$${product.product.price}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<CartCubit>()
                                    .removeProduct(product.product, context);
                              },
                              child: const SizedBox(
                                child: Icon(
                                  Icons.remove,
                                  color: Color(0xff8417d1),
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '${product.quantity.ceil()}',
                              style: const TextStyle(
                                  color: Color(0xff8417d1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            InkWell(
                              onTap: product.quantity >=
                                      product.product.quantity
                                  ? null
                                  : () {
                                      context
                                          .read<CartCubit>()
                                          .addProduct(product.product, context);
                                    },
                              child: SizedBox(
                                child: Icon(
                                  Icons.add,
                                  color: product.quantity >=
                                          product.product.quantity
                                      ? Colors.grey
                                      : const Color(0xff8417d1),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '\$ ',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${state.totalPrice.ceil()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff8417d1),
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Check Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
