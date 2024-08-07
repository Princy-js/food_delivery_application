import 'package:flutter/material.dart';
import 'package:food_delivery_app/custom_components/my_quantity_selector.dart';
import 'package:food_delivery_app/model/cart_item.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:food_delivery_app/model/restaurent.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem
    });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child)=>Container(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)
          ),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food image
                    Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(cartItem.food.imagePath))
                      ),
                    ),
                    SizedBox(width: 12,),
                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        SizedBox(
                          width:110 ,
                          child: Text(cartItem.food.name)),
                        // food price
                        Text("\$" + cartItem.food.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 30,),
                    // increment or decrement quantity
                    QuantitySelector(
                      quantity: cartItem.quantity, 
                      food: cartItem.food, 
                      onDecrement: (){
                        restaurant.removeFromCart(cartItem);
                      }, 
                      onIncrement: (){
                        restaurant.addToCart(
                          cartItem.food, 
                          cartItem.selectedAddons
                        );
                      }
                    )
                  ],
                ),
              ),
              // addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60 ,
                child: ListView(
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddons
                  .map(
                    (addons) => Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: FilterChip(
                        label: Row(
                          children: [
                            // addon name
                            Text(addons.name),
                            // addon price
                            Text("(\$ ${addons.price})")
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary
                          )
                        ), 
                        onSelected: (value){},
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12
                          ),
                        ),
                    )
                    ).toList()
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}