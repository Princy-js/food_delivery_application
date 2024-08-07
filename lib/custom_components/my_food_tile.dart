import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/model/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const MyFoodTile({
    super.key,
    required this.food,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text('\$ '+food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(width: 15,),
              // food image
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(food.imagePath))
                ),
              )
              ],
            ),
          ),
        ),
        // divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 25,
          endIndent: 25,  
        )
      ],
    );
  }
}
