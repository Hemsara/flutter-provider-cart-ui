import 'package:cart_ui/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 254,
        assetName: 'headphone.png',
        isAvailable: true),
    ProductModel(
        name: "Apple Airpods Max Wireless Headphones",
        price: 350,
        assetName: 'airpods.png',
        isAvailable: false),
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 175,
        assetName: 'headphone.png',
        isAvailable: true),
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 985,
        assetName: 'headphone.png',
        isAvailable: true),
  ];
  List<ProductModel> get products => _products;

  //accessories
  final List<ProductModel> _accessories = [
    ProductModel(
        name: "Apple Homepod mini",
        price: 254,
        assetName: 'homepod.png',
        isAvailable: true),
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 350,
        assetName: 'headphone.png',
        isAvailable: false),
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 175,
        assetName: 'headphone.png',
        isAvailable: true),
    ProductModel(
        name: "AKG N700NCM2 Wireless Headphones",
        price: 985,
        assetName: 'headphone.png',
        isAvailable: true),
  ];
  List<ProductModel> get accessories => _accessories;


}
