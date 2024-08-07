import 'package:food_delivery_app/model/food.dart';

class CartItem {
  Food food;
  List<Addons> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonprice = selectedAddons.fold(0, (sum, addons) => sum + addons.price);
    return (food.price + addonprice) * quantity;
  }

}