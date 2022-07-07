import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/cart/cart.dart';
import 'package:my_wallet/location/location.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  final prefSize = const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, cart) {
      return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 0,
        bottom: PreferredSize(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              height: prefSize.height,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, LocationPage.createRoute());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Your location',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 14,
                                color: Colors.red,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'CustomLocation',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, CartPage.route);
                      },
                      icon: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            'assets/icons/shopping-bag.png',
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                              top: -10,
                              right: -10,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 500),
                                opacity: cart.isEmptyCart ? 0 : 1,
                                curve: Curves.easeInBack,
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        cart.totalCart.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),
                                      ),
                                    )),
                              ))
                        ],
                      ))
                ],
              ),
            ),
            preferredSize: prefSize),
      );
    });
  }

  @override
  Size get preferredSize => prefSize;
}
