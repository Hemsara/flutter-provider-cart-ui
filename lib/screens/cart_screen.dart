import 'package:cart_ui/provider/cart_provider.dart';
import 'package:cart_ui/screens/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appbar(context),
              const SizedBox(height: 30),
              _cart(),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Info",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sub total",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        "\$${context.watch<CartProvider>().totalPrice}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Shopping cost",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        "+${context.watch<CartProvider>().shoppingCost}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        "\$${context.watch<CartProvider>().totalPrice + context.watch<CartProvider>().shoppingCost}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff0040FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: context.watch<CartProvider>().totalPrice > 0
                        ? Text(
                            "CHECKOUT \$(${context.watch<CartProvider>().totalPrice + context.watch<CartProvider>().shoppingCost})",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 12),
                          )
                        : const Text(
                            "CONTINUE SHOPPING",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Row _appbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
                size: 26,
              ),
            ),
          ),
        ),
        const Text(
          "Order Details",
          style: TextStyle(fontSize: 15),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffF2F2F4)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Icon(
              Iconsax.user,
              color: Colors.grey,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _cart() {
    return Expanded(
      child: SizedBox(
        child: context.watch<CartProvider>().cart.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Cart",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Consumer<CartProvider>(
                      builder: (context, value, _) {
                        return Column(
                          children:
                              value.cart.map((e) => CartItem(c: e)).toList(),
                        );
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Iconsax.bag,
                      size: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Your cart is empty!",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
