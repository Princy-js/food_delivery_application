import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/custom_components/my_button.dart';
import 'package:food_delivery_app/model/food.dart';
import 'package:food_delivery_app/model/restaurent.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};
  FoodDetailsPage({
    super.key,
    required this.food,
  }){
    // Initialize selected addons to be false
    for(Addons addons in food.availableAddons){
      selectedAddons[addons] = false;
    }
  }

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  // method to add to cart
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    // close the current food page to go back to menu
    Navigator.pop(context);

    // format the selected addons
    List<Addons> currentlySelectedAddons = [];
    for (Addons addons in widget.food.availableAddons) {
      if (widget.selectedAddons[addons] == true) {
        currentlySelectedAddons.add(addons);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Scaffold ui
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // food image
            Container(
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.food.imagePath
                    )
                  )
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 // food name
              Text(widget.food.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              // food price
              Text('\$'+widget.food.price.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              SizedBox(height: 10,),
              // food description
              Text(widget.food.description),
        
              SizedBox(height: 10,),
        
              Divider(color: Theme.of(context).colorScheme.secondary,),
        
              SizedBox(height: 10,),
        
              Text("Add-ons",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              SizedBox(height: 10,),
        
              // addons
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context,index){
                  // get individual addons
                  Addons addons = widget.food.availableAddons[index];
                  return CheckboxListTile(
                    title: Text(addons.name),
                    subtitle: Text('\$'+  addons.price.toString(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    value: widget.selectedAddons[addons], 
                    onChanged: (bool? value){
                        setState(() {
                          widget.selectedAddons[addons] = value!;
                        });
                      }
                    );
                  }
                ),
               )
              ],
             ),
            ),
            // button -> add to the cart
            MyButton(
              onTapped: () => addToCart(widget.food, widget.selectedAddons), 
              text: 'Add to cart'),

            SizedBox(height: 25,)
              ],
            ),
          ),
        ),
      // back Button
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ),
        )
      )
      ],
    );
  }
}