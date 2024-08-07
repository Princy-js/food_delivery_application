import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/model/restaurent.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  final TextEditingController textController = TextEditingController();

  void openLocationBox(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        title: Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "Enter address.."
          ),
        ),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: ()=> Navigator.pop(context),
            child: Text("Cancel"),  
          ),
          // save button
          MaterialButton(
            onPressed: (){
              // update delivery address
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAddress(newAddress); 
              Navigator.pop(context);
            } ,
            child: Text("save"),  
          )
        ],
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          GestureDetector(
            onTap: ()=> openLocationBox(context),
            child: Row(
              children: [
                // address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                // drop down menu
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
  
 
}