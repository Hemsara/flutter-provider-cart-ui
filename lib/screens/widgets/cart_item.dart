import 'package:cart_ui/models/cart_model.dart';
import 'package:cart_ui/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartModel c;
  const CartItem({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 110,
            decoration: BoxDecoration(
                color: const Color(0xffF2F2F4),
                borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Image(
                image: AssetImage(c.product.assetName),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.product.name,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${c.product.price}",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<CartProvider>().decrementQty(c.id),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffF2F2F4)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.minus,
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      c.quantity.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () =>
                          context.read<CartProvider>().incrementQty(c.id),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffF2F2F4)),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.add,
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CartProvider>().deleteItem(c.id);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color.fromARGB(255, 247, 247, 247),
                content: Text(
                  "Item removed!",
                  style: TextStyle(color: Colors.black),
                ),
              ));
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.07),
              radius: 18,
              child: const Icon(
                Iconsax.trash,
                color: Colors.redAccent,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
