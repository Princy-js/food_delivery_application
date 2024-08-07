import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    // burger
    Food(
      name: "Classic Cheesburger", 
      description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle", 
      imagePath: "lib/images/burger/burger-1.png", 
      price: 8.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
          Addons(name: "Extra Cheese",price: 0.99),
          Addons(name: "Bacon", price: 1.49),
          Addons(name: "Avacodo", price: 1.99)
      ]
    ),
    Food(
      name: "BBQ Bacon Burger", 
      description: "Smoky BBQ sauce, cripsy bacon, and rings make this beef burger a savory delight", 
      imagePath: "lib/images/burger/burger-2.png", 
      price: 10.99, 
      category: FoodCategory.burgers, 
      availableAddons:[
        Addons(name: "Grilled Onion", price: 0.99),
        Addons(name: "Jalapenos", price: 1.49),
        Addons(name: "Extra BBQ Sauce", price: 1.67)
      ]
    ),
    Food(
      name: "Veggie Burger", 
      description: "A healthy veggie patty topped with fresh avacado", 
      imagePath: "lib/images/burger/burger-3.png", 
      price: 9.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addons(name: "Vegan Cheese", price: 0.99),
        Addons(name: "Grilled Mushroom", price: 1.49),
        Addons(name: "Hummus Spread", price: 1.99)
      ]
    ),
    Food(
      name: "Aloha Burger", 
      description: "A char-grilled chicken breast topped with a slice of grilled pineapple, Swiss cheese.", 
      imagePath: "lib/images/burger/burger-4.png", 
      price: 9.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addons(name: "Teriyaki Glaze", price: 0.99),
        Addons(name: "Extra Pineapple", price: 0.99),
        Addons(name: "Bacon", price: 1.49)
      ]
    ),
    Food(
      name: "Blue Moon Burger", 
      description: "This burger is a blue cheese lover's dream. It features a succulent ground beef patty.", 
      imagePath: "lib/images/burger/burger-5.png", 
      price: 9.69, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addons(name: "Sauteed Mushroom", price: 0.99),
        Addons(name: "Fried Egg", price: 1.49),
        Addons(name: "Spicy Mayo", price: 0.99)
      ]
    ),
    //Salad
    Food(
      name: "Ceaser Salad", 
      description: "Crisp romaine lettuce, parmesan cheese, croutons, and Ceaser dressing", 
      imagePath: "lib/images/salads/salad-1.png", 
      price: 7.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addons(name: "Grilled Chicken", price: 0.99),
        Addons(name: "Anchovis", price: 1.49),
        Addons(name: "Extra Parmesan", price: 1.99)
      ]
    ),
    Food(
      name: "Greek Salad", 
      description: "Tomatos, cucumbers, red onions, olives, feta cheese with olive oil and herbs", 
      imagePath: "lib/images/salads/salad-3.png", 
      price: 8.49, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addons(name: "Feta Cheese", price: 0.99),
        Addons(name: "Kalamata Olives", price: 1.49),
        Addons(name: "Grilled", price: 1.99)
      ]
    ),
    Food(
      name: "Quinoa Salad", 
      description: "Quinoa mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette", 
      imagePath: "lib/images/salads/salad-2.png", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addons(name: "Avocado", price: 0.99),
        Addons(name: "Feta Cheese", price: 1.49),
        Addons(name: "Grilled Chicken", price: 1.99)
      ]
    ),
    Food(
      name: "Asian Sesame Salad", 
      description: "Delight in flavour of the East with this sesame-infused salad. It includes mixed green chilly", 
      imagePath: "lib/images/salads/salad-5.png", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addons(name: "Mandarin Oranges", price: 0.99),
        Addons(name: "Almond Slivers", price: 1.49),
        Addons(name: "Extra Teriyaki Chicken", price: 1.99)
      ]
    ),
    Food(
      name: "South West Chicken Salad", 
      description: "This colorful salad combines the zesty flavors of the Southwest.", 
      imagePath: "lib/images/salads/salad-4.png", 
      price: 9.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addons(name: "Sour Cream", price: 0.99),
        Addons(name: "Pico de Gallo", price: 1.49),
        Addons(name: "Guacamole", price: 1.99)
      ]
    ),
    //sides
    Food(
      name: "Sweet potato Fries", 
      description: "Crispy sweet potato fries with a touch of salt", 
      imagePath: "lib/images/sides/sides-1.png", 
      price: 4.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addons(name: "Cheese Sauce", price: 0.99),
        Addons(name: "Truffle Oil", price: 1.49),
        Addons(name: "Cajun Spice", price: 1.99)
      ]
    ),
    Food(
      name: "Egg noodles", 
      description: "Noodles with half boiled egg,tomato sauce and salad", 
      imagePath: "lib/images/sides/sides-2.png", 
      price: 6.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addons(name: "Corn Dip", price: 1.99),
        Addons(name: "Spicy Sauce", price: 1.45),
        Addons(name: "Egg white", price: 1.49)
      ]
    ),
    Food(
      name: "Spicy Noodles", 
      description: "Noodles with chilli paste, tomato and brocoli", 
      imagePath: "lib/images/sides/sides-3.png", 
      price: 3.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addons(name: "Tomato Dip", price: 1.99),
        Addons(name: "Marinara Dip", price: 1.49),
        Addons(name: "Extra Garlic", price: 0.99)
      ]
    ),
    Food(
      name: "Cheesy Pizza", 
      description: "Tasty pizza with full of cheese and tomato", 
      imagePath: "lib/images/sides/sides-4.png", 
      price: 4.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addons(name: "Extra Cheese", price: 0.99),
        Addons(name: "Bacon Bites", price: 1.49),
        Addons(name: "Chilli flakes", price: 0.99)
      ]
    ),
    Food(
      name: "Creamy Pasta", 
      description: "Creamy pasta with vegitables and tomato Sauce for flavoring", 
      imagePath: "lib/images/sides/sides-5.png", 
      price: 4.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addons(name: "Jalapeno Slice", price: 0.99),
        Addons(name: "Sriracha Drizzle", price: 1.49),
        Addons(name: "Extra Cream", price:0.99)
      ]
    ),
    //dessert
    Food(
      name: "Chocolate Brownie", 
      description: "Rich and fudgy chocolate brownie, with chunks of chocolate", 
      imagePath: "lib/images/desserts/dessert-5.jpg", 
      price: 5.99, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addons(name: "Chocolate Ice cream", price: 0.99),
        Addons(name: "Hot Fudge", price: 1.49),
        Addons(name: "Whipped Cream", price: 1.99)
      ]
    ),
    Food(
      name: "Cheesecake", 
      description: "Creamy cheesecake on a graham cracker crust, with a berry compote", 
      imagePath: "lib/images/desserts/dessert-3.jpg", 
      price: 6.99, 
      category: FoodCategory.desserts, 
      availableAddons:[
        Addons(name: "Berry Topping", price: 0.99),
        Addons(name: "Blueberry Compote", price: 1.49),
        Addons(name: "Chocolate Chips", price: 1.99)
      ]
    ),
    Food(
      name: "Chocolate Lava Cake", 
      description: "A delectable chocolate cake with warm, gooey chocolate lava center, served with scoop", 
      imagePath: "lib/images/desserts/dessert-4.jpg", 
      price: 5.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addons(name: "Raspberry Sauce", price: 0.99),
        Addons(name: "Cream Cheese Icing", price: 1.49),
        Addons(name: "Chocolate Sprinkles", price: 0.99)
      ]
    ),
    Food(
      name: "Pan cake ", 
      description: "Pan cake with fresh cream and strawberry filling", 
      imagePath: "lib/images/desserts/dessert-1.jpg", 
      price: 5.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addons(name: "Strawberry Sauce", price: 0.99),
        Addons(name: "Extra cream", price: 1.49),
        Addons(name: "Milk made", price: 1.99)
      ]
    ),
    Food(
      name: "Coffee Chocolate Icecream", 
      description: "Coffee with Chocolate and filled with vanila ice cream ", 
      imagePath: "lib/images/desserts/dessert-2.jpg", 
      price: 5.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addons(name: "Raspberry Sauce", price: 0.99),
        Addons(name: "Cream Cheese Icing", price: 1.49),
        Addons(name: "Chocolate Sprinkles", price: 0.99)
      ]
    ),
    //drinks
    Food(
      name: "Lemonade", 
      description: "Refreshing lemonade made with real lemons and a touch of sweetness.", 
      imagePath: "lib/images/drinks/drink-2.png", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addons(name: "Strawberry Flavor", price: 0.99),
        Addons(name: "Mint Leaves", price: 1.49),
        Addons(name: "Ginger Zest", price: 1.99)
      ]
    ),
    Food(
      name: "Iced Apple Juice", 
      description: "Chilled iced Apple Juice with Ice cubes, serverd over ice", 
      imagePath: "lib/images/drinks/drink-3.png", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addons(name: "Peach Flavor", price: 0.99),
        Addons(name: "Honey", price: 1.49),
        Addons(name: "Sliced Apple", price: 1.99)
      ]
    ),
    Food(
      name: "Smoothie", 
      description: "A blend of fresh fruits and yogurt, perfect for a healthy boost", 
      imagePath: "lib/images/drinks/drink-5.png", 
      price: 4.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addons(name: "Protein Powder", price: 0.99),
        Addons(name: "Almond milk", price: 1.49),
        Addons(name: "Cherry pulp", price: 1.39)
      ]
    ),
    Food(
      name: "Orange Juice", 
      description: "Iced Orange Juice with sugar, sliced orange and mint", 
      imagePath: "lib/images/drinks/drink-1.png", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addons(name: "Mint leaves", price: 0.99),
        Addons(name: "Orange flavor", price: 0.49),
        Addons(name: "Sliced Orange", price: 1.49)
      ]
    ),
    Food(
      name: "Pineapple Juice", 
      description: "Iced Pineapple Juice with sugar, sliced pineapple and extra pineapple falvor", 
      imagePath: "lib/images/drinks/drink-4.png", 
      price: 4.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addons(name: "Sugar syrup", price: 0.99),
        Addons(name: "Hazelnut syrup", price: 0.49),
        Addons(name: "Sliced pineapple", price: 1.39)
      ]
    )
  ];


  // user cart
  final List<CartItem> _cart = [];

  // delivery address (which user can change/update)
  String _deliveryAddress = "99 Hollywood Blv";

  /*

  G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

  O P E R A T I O N S

  */


  // add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItems = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    // if the item already exists, increase it's quantity
    if (cartItems != null){
      cartItems.quantity++;
    }
    // otherwise, add a new cart item to the cart
    else{
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons)
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1) {
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for(Addons addons in cartItem.selectedAddons) {
        itemTotal += addons.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for(CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  // update the delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }
  
  /*

  H E L P E R S

  */

  // generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = 
      DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------------------------------------");
    receipt.writeln();

    for(final CartItem in _cart) {
      receipt.writeln(
        "${CartItem.quantity} x ${CartItem.food.name} - ${_formatPrice(CartItem.food.price)}"
      );
      if(CartItem.selectedAddons.isNotEmpty){
        receipt.writeln("    Add-ons : ${_formatAddons(CartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("------------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to : $deliveryAddress");
    

    return receipt.toString();
  }
  
  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addons> addons) {
    return addons.map((addons) => "${addons.name} (${_formatPrice(addons.price)})").join(",");
  }
}