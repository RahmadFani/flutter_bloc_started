import 'package:flutter/material.dart';
import 'package:my_wallet/product_detail/product_detail.dart';
import 'package:product_repository/product_repository.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key, required this.productList}) : super(key: key);

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Our Product',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: ((MediaQuery.of(context).size.width / 2) / 300),
              children: productList.map((product) {
                return LayoutBuilder(
                  builder: (_, constraints) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            ProductDetailPage.buildRoute(
                              product,
                            ));
                      },
                      child: Card(
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: constraints.maxHeight / 1.5,
                              width: double.infinity,
                              child: Hero(
                                tag: 'image_${product.id}',
                                child: Image.network(
                                  product.imageUrl ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product.name ?? "",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '\$ ${product.price ?? ""}',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    product.readyStock
                                        ? "Ready Stock"
                                        : "Out of Stock",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
