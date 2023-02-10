// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cart_ui/models/product_model.dart';
import 'package:cart_ui/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  final bool showAvailability;
  final ProductModel p;

  const Product({super.key, required this.showAvailability, required this.p});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Container(
        width: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF2F2F2),
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(p.assetName),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: p.isAvailable
                      ? GestureDetector(
                          onTap: () {
                            context.read<CartProvider>().addToCart(p);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor:
                                  Color.fromARGB(255, 247, 247, 247),
                              content: Text(
                                "Item added!",
                                style: TextStyle(color: Colors.black),
                              ),
                            ));
                          },
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            radius: 13,
                            child: Icon(
                              Iconsax.bag,
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        )
                      : SizedBox(),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              p.name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            SizedBox(
              child: showAvailability
                  ? SizedBox(
                      child: p.isAvailable
                          ? Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xff03B680),
                                  radius: 3,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Available",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff03B680)),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.redAccent,
                                  radius: 3,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Not Available",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.redAccent),
                                ),
                              ],
                            ),
                    )
                  : null,
            ),
            SizedBox(height: 4),
            Text(
              "\$${p.price}",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
