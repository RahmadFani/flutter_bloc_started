import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/cart/cart.dart';
import 'package:product_repository/product_repository.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  static Route buildRoute(ProductModel product) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      return FadeTransition(
        opacity: animation,
        child: ProductDetailPage(
          product: product,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.white,
                  child: Hero(
                    tag: 'image_${product.id}',
                    child: Image.network(
                      product.imageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: kToolbarHeight + 10,
                    left: 20,
                    child: Material(
                      type: MaterialType.circle,
                      color: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: 'bacground_${product.id}',
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                    ),
                  ),
                )
              ],
            )),
            Hero(
              tag: 'bacground_2_${product.id}',
              child: Container(
                height: 150,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(product.name ?? "",
                        style: Theme.of(context).textTheme.headline6),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(product.description ?? "",
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, cart) {
                bool contain = cart.productList
                    .where((element) => element.product == product)
                    .isNotEmpty;
                CartModel myCart = cart.productList.firstWhere(
                  (element) => element.product == product,
                  orElse: () => CartModel(product: product),
                );
                return Container(
                  height: 100,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            '${product.price?.ceil() ?? "0"}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      const Spacer(),
                      product.readyStock
                          ? contain
                              ? Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(25)),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<CartCubit>()
                                              .removeProduct(product, context);
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
                                        width: 12,
                                      ),
                                      Text(
                                        '${myCart.quantity.ceil()}',
                                        style: const TextStyle(
                                            color: Color(0xff8417d1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      InkWell(
                                        onTap:
                                            product.quantity <= myCart.quantity
                                                ? null
                                                : () {
                                                    context
                                                        .read<CartCubit>()
                                                        .addProduct(
                                                            product, context);
                                                  },
                                        child: SizedBox(
                                          child: Icon(
                                            Icons.add,
                                            color: product.quantity <=
                                                    myCart.quantity
                                                ? Colors.grey
                                                : const Color(0xff8417d1),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    context
                                        .read<CartCubit>()
                                        .addProduct(product, context);
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Color(0xff8417d1),
                                          size: 24,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'Add To Cart',
                                          style: TextStyle(
                                              color: Color(0xff8417d1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                          : const Text(
                              'Out of Stock',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
