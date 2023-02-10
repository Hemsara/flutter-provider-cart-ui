import 'package:uuid/uuid.dart';

var uuid = Uuid();

class ProductModel {
  final String id;
  final String name;
  final double price;
  final String assetName;
  final bool isAvailable;
  ProductModel({
    required this.name,
    required this.price,
    required this.assetName,
    required this.isAvailable,
  }) : id = uuid.v4();
}
