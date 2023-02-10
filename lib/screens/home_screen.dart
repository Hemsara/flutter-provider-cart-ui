

import 'package:cart_ui/provider/cart_provider.dart';
import 'package:cart_ui/provider/product_provider.dart';
import 'package:cart_ui/screens/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/cart'),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffF2F2F4)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Iconsax.bag,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
                Positioned(
                  right: -3,
                  top: -3,
                  child: context.watch<CartProvider>().cart.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 7,
                          child: Text(
                            context
                                .watch<CartProvider>()
                                .cart
                                .length
                                .toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 9),
                          ),
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ],
      );
    }

    Column _products() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " 45",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
              const Text(
                "See all",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0040FF)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<ProductProvider>(
              builder: (context, value, _) {
                return Row(
                    children: value.products
                        .map((e) => Product(
                              showAvailability: false,
                              p: e,
                            ))
                        .toList());
              },
            ),
          )
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle:
              const TextStyle(fontSize: 11, color: Color.fromARGB(255, 0, 0, 0)),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.home,
                  size: 20,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.shop,
                  size: 20,
                ),
                label: "Shop"),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.save_2,
                  size: 20,
                ),
                label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(
                  Iconsax.user,
                  size: 20,
                ),
                label: "Profile"),
          ]),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              const SizedBox(height: 40),
              _header(),
              const SizedBox(height: 50),
              _products(),
              const SizedBox(height: 50),
              _accessories(),
            ],
          ),
        ),
      ),
    );
  }

  Column _accessories() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Accessories",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  " 45",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
            const Text(
              "See all",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0040FF)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<ProductProvider>(
            builder: (context, value, _) {
              return Row(
                children: value.accessories
                    .map((e) => Product(showAvailability: true, p: e))
                    .toList(),
              );
            },
          ),
        )
      ],
    );
  }

  Column _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Hi-Fi Shop & Service",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 15),
        Text(
          "Audio shop on Rustaveli Ave 57.",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          "This shop offers both products and services",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }
}
