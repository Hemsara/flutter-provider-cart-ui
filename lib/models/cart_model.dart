import 'package:cart_ui/models/product_model.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class CartModel {
  final String id;
  final ProductModel product;
  int quantity;
  CartModel({
    required this.product,
    required this.quantity,
  }) : id = uuid.v4();
}
